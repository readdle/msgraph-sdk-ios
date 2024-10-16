// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionDataTask.h"
#import "MSURLSessionTask+Protected.h"
#import "ODataBaseClient.h"
#import "NSJSONSerialization+ResponseHelper.h"
#import "MSConstants.h"

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
        if (!error && response){
            resolvedResponse = [NSJSONSerialization dictionaryWithResponse:response responseData:data error:&resolvedError];
        }
        else {
            // In some cases, we want to have access to HTTP response headers.
            // For example, when handling throttling https://readdle-j.atlassian.net/browse/EXP-12495
            //
            // We are currently using some dry crap 2018 year MS Graph SDK.
            // It has this shitty (NSDictionary *dictionary, NSError *error) completions.
            //
            // In a more "modern" SDK (https://github.com/microsoftgraph/msgraph-sdk-objc/tree/master)
            // (also deprecated by MS in Apr 2023), they have better completions – they pass
            // the whole (NSData *data, NSURLResponse *response, NSError *error) stuff to the client.
            //
            // I don't want to update the completions signature in this corpse, as this will
            // cause a ton of changes in the SDK itself and in the client code. That's why
            // this koziulya was born.
            //
            // I considered passing the `allHeaderFields` to the client (via error.userInfo),
            // but didn't do that, as with `valueForHTTPHeaderField` we have the case-insensitivity provided by
            // NSHTTPURLResponse. Otherwise we would have to deal with it at client's side.
            //

            NSString *retryAfter = nil;
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                retryAfter = [httpResponse valueForHTTPHeaderField:@"Retry-After"];
            }

            if (nil == retryAfter) {
                resolvedError = error;
            }
            else {
                NSMutableDictionary *userInfo = error.userInfo ? [error.userInfo mutableCopy] : [NSMutableDictionary new];
                userInfo[@"Retry-After"] = retryAfter;

                resolvedError = [NSError errorWithDomain:error.domain code:error.code userInfo:userInfo];
            }
        }

        if (self.completionHandler){
            self.completionHandler(resolvedResponse, resolvedError);
        }
    }];
}

@end
