// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionDataTask.h"
#import "MSURLSessionTask+Protected.h"
#import "ODataBaseClient.h"
#import "NSJSONSerialization+ResponseHelper.h"
#import "MSConstants.h"
#import "NSURLRequest+VerboseDebug.h"
#import "NSURLResponse+VerboseDebug.h"

@interface MSURLSessionDataTask()

@property (strong) void (^completionHandler)(NSDictionary *dictionary, NSError *error);

@end

@implementation MSURLSessionDataTask

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
                     completion:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler
{
    self = [super initWithRequest:request client:client];
    if (self){
        _completionHandler = completionHandler;
    }
    return self;
}

- (void)authenticationFailedWithError:(NSError *)authError
{
    if (self.completionHandler){
        self.completionHandler(nil, authError);
    }
}

- (NSURLSessionDataTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    NSParameterAssert(request);
    
    if (![request.HTTPMethod isEqualToString:@"GET"]){
        [request setValue:MSHeaderApplicationJson forHTTPHeaderField: MSHeaderContentType];
    }
    return [self.client.httpProvider dataTaskWithRequest:request
                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                      
        self->_state = MSURLSessionTaskStateTaskCompleted;
       NSError *resolvedError = nil;
       NSDictionary *resolvedResponse = nil;
        if (!error && response) {
            resolvedResponse = [NSJSONSerialization dictionaryWithResponse:response responseData:data error:&resolvedError];
        }
        else {
            resolvedError = error;
        }

        if (resolvedError) {
            [self.client.logger logWithLevel:MSLogLevelLogError message:@"Data task request failed."];
            [self.client.logger logWithLevel:MSLogLevelLogError
                                     message:[NSString stringWithFormat:@"Request:\n\n%@\n----",
                                              request.verboseDebugDescription]];
            [self.client.logger logWithLevel:MSLogLevelLogError
                                     message:[NSString stringWithFormat:@"Response:\n\n%@\n----",
                                              [response verboseDebugDescriptionWithData:data]]];
        }

        if (self.completionHandler){
            self.completionHandler(resolvedResponse, resolvedError);
        }
    }];
}

@end
