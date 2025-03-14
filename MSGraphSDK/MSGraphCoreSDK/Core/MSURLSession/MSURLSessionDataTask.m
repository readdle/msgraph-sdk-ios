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
                                              [self.class verboseDebugDescriptionForRequest:request]]];
            [self.client.logger logWithLevel:MSLogLevelLogError
                                     message:[NSString stringWithFormat:@"Response:\n\n%@\n----",
                                              [self.class verboseDebugDescriptionForResponse:response withData:data]]];
        }

        if (self.completionHandler){
            self.completionHandler(resolvedResponse, resolvedError);
        }
    }];
}

#pragma mark - logging utils -

+ (NSString *)verboseDebugDescriptionForRequest:(NSURLRequest *)request {
    NSMutableString *description = [NSMutableString string];

    [description appendFormat:@"%@: %@\n\n", request.HTTPMethod, request.URL.absoluteString];

    // Headers
    [description appendString:@"Headers:\n"];
    if (request.allHTTPHeaderFields.count > 0) {
        [request.allHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            if ([key isEqualToString:@"Authorization"]) {
                value = @"<secret>";
            }
            
            [description appendFormat:@"\t%@: %@\n", key, value];
        }];
    }
    else {
        [description appendString:@"\t<None>\n"];
    }

    // Body
    if (request.HTTPBody) {
        NSString *bodyString = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
        if (bodyString) {
            [description appendFormat:@"Body:\n%@\n", bodyString];
        }
        else {
            [description appendFormat:@"Body:\n<non-UTF8 data, %lu bytes>\n", (unsigned long)request.HTTPBody.length];
        }
    }
    else if (request.HTTPBodyStream) {
        [description appendString:@"Body: <HTTPBodyStream present, content not directly readable>\n"];
    }
    else {
        [description appendString:@"Body: <None>\n"];
    }

    [description appendFormat:@"Timeout Interval: %.2fs\n", request.timeoutInterval];
    [description appendFormat:@"Cache Policy: %ld\n", (long)request.cachePolicy];

    [description appendFormat:@"debugDescription: %@", request.debugDescription];

    return description;
}

+ (NSString *)verboseDebugDescriptionForResponse:(NSURLResponse *)response withData:(NSData *)data {
    NSMutableString *description = [NSMutableString string];

    [description appendFormat:@"URL: %@\n", response.URL.absoluteString];

    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;

        [description appendFormat:@"Status Code: %ld\n", (long)httpResponse.statusCode];

        // Headers
        [description appendString:@"Headers:\n"];
        if (httpResponse.allHeaderFields.count > 0) {
            [httpResponse.allHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
                [description appendFormat:@"\t%@: %@\n", key, value];
            }];
        }
        else {
            [description appendString:@"\t<None>\n"];
        }
    }
    else {
        [description appendFormat:@"<Non-HTTP Response of type %@>\n", NSStringFromClass([response class])];
    }

    // Response metadata
    [description appendFormat:@"Expected Content Length: %lld\n", response.expectedContentLength];
    [description appendFormat:@"Text Encoding: %@\n", response.textEncodingName ?: @"<None>"];

    // Body
    if (data) {
        NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (bodyString) {
            [description appendFormat:@"Body:\n%@\n", bodyString];
        }
        else {
            [description appendFormat:@"Body:\n<non-UTF8 data, %lu bytes>\n", (unsigned long)data.length];
        }
    }
    else {
        [description appendString:@"Body: <None>\n"];
    }

    [description appendFormat:@"debugDescription: %@", response.debugDescription];

    return description;
}

@end
