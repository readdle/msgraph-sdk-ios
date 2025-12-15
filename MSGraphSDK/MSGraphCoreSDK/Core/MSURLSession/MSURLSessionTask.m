// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionTask.h"
#import "ODataBaseClient.h"
#import "MSConstants.h"

@interface MSURLSessionTask()

@property (readonly) NSMutableURLRequest *request;
@property (nonatomic, assign) BOOL skipAuthentication;

@end

@implementation MSURLSessionTask

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
{
    return [self initWithRequest:request client:client skipAuthentication:NO];
}

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
             skipAuthentication:(BOOL)skipAuthentication
{
    NSParameterAssert(request);
    NSParameterAssert(client);
    
    self = [super init];
    if (self){
        _client = client;
        _request = request;
        _skipAuthentication = skipAuthentication;
        _state = MSURLSessionTaskStateTaskCreated;
    }
    return self;
}

- (void)execute;
{
    _state = MSURLSessionTaskStateTaskAuthenticating;
    
    //If no Content-Type is set, use text/plain
    
    if([self.request valueForHTTPHeaderField:@"Content-Type"]==nil)
    {
        [self.request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    }

    if (self.skipAuthentication) {
        [self startTaskWithRequest:self.request];
        return;
    }

    [self.client.authenticationProvider appendAuthenticationHeaders:self.request completion:^(NSMutableURLRequest *request, NSError *error){
        if (self.state != MSURLSessionTaskStateTaskCanceled){
            if (!error){
                [self startTaskWithRequest:request];
            }
            else{
                self->_state = MSURLSessionTaskStateTaskAuthFailed;
                [self.client.logger logWithLevel:MSLogLevelLogError message:@"Authentication Failed with error :%@", error];
                [self authenticationFailedWithError:error];
            }
        }
    }];
}

- (void)startTaskWithRequest:(NSMutableURLRequest *)request {
    self->_state = MSURLSessionTaskStateTaskExecuting;
    self->_innerTask = [self taskWithRequest:request];
    [self.client.logger logWithLevel:MSLogLevelLogInfo message:@"Created NSURLSessionTask"];
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Task Id : %ld", self->_innerTask.taskIdentifier];

    if (self.client.throttlingCoordinator) {
        NSURLSessionTask *__weak weakInnerTask = self->_innerTask;
        [self.client.throttlingCoordinator performThrottled:^{
            // the task may have been cancelled by now, but `resume` should do nothing in that case.
            // adding an `if (weakInnerTask.state == NSURLSessionTaskStateSuspended)` check here would
            // only introduce a potential race condition.
            [weakInnerTask resume];
        }];
    }
    else {
        [self->_innerTask resume];
    }
}

- (void)cancel
{
    [self.client.logger logWithLevel:MSLogLevelLogInfo message:@"Canceled task"];
    if (_innerTask){
        [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"inner task : %l", [_innerTask taskIdentifier]];
        [_innerTask cancel];
    }
    _state = MSURLSessionTaskStateTaskCanceled;
}

- (NSURLSessionTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    NSAssert(NO, @"Not Implemented, must implement in sub class");
    return nil;
}

- (void)authenticationFailedWithError:(NSError *)authError
{
    NSAssert(NO, @"Not Implemented, must implement in sub class");
}

@end
