// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "NSJSONSerialization+ResponseHelper.h"
#import "MSConstants.h"
#import "MSError.h"

@implementation NSJSONSerialization (ResponseHelper)

+ (NSDictionary *)dictionaryWithResponse:(NSURLResponse *)response responseData:(NSData *)data error:(NSError * __autoreleasing *)error
{
    NSParameterAssert(response);
    
    NSDictionary *responseDictionary = nil;
    NSError *parseError = nil;
    NSInteger statusCode = ((NSHTTPURLResponse*)response).statusCode;
    
    //make sure we don't try and parse bad nothing
    if (data && [data bytes]){
        responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseError];
    }
    // if there was a parse error and the caller wants the error to be set
    if (parseError && error){
        *error = parseError;
    }
    // try and parse the client error
    else if ((statusCode < 200 || statusCode > 299) && error) {
        NSError *resolvedError = [NSJSONSerialization errorWithStatusCode:statusCode responseDictionary:responseDictionary];

        if (resolvedError) {
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

            if (retryAfter) {
                NSMutableDictionary *userInfo = resolvedError.userInfo ? [resolvedError.userInfo mutableCopy] : [NSMutableDictionary new];
                userInfo[@"Retry-After"] = retryAfter;

                resolvedError = [NSError errorWithDomain:resolvedError.domain code:resolvedError.code userInfo:userInfo];
            }
        }

        *error = resolvedError;
    }
    // if an error occurred we shouldn't return the json response
    if (error && *error){
        responseDictionary = nil;
    }
    
    return responseDictionary;
}

+ (NSError *)errorWithStatusCode:(NSInteger)statusCode responseDictionary:(NSDictionary *)responseDictionary
{
    NSParameterAssert(statusCode);
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[NSLocalizedDescriptionKey] = [NSHTTPURLResponse localizedStringForStatusCode:(NSInteger)statusCode];
    MSError *responseError = nil;
    if (responseDictionary){
        responseError = [MSError errorWithDictionary:responseDictionary[MSErrorKey]];
    }
    if (responseError){
        userInfo[MSErrorKey] = responseError;
    }
    return [NSError errorWithDomain:MSErrorDomain code:statusCode userInfo:userInfo];
}

+ (NSError *)errorFromResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject
{
    NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
    if (statusCode < 200 || statusCode > 299){
        return [NSJSONSerialization errorWithStatusCode:statusCode responseDictionary:@{}];
    }
    return nil;
}

@end
