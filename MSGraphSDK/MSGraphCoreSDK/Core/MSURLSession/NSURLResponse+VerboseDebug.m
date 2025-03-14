//
//  NSURLResponse+VerboseDebug.m
//  MSGraphSDK
//
//  Created by Zoreslav Khimich on 13.03.2025.
//  Copyright © 2025 Microsoft. All rights reserved.
//

#import "NSURLResponse+VerboseDebug.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSURLResponse (VerboseDebug)

- (NSString *)verboseDebugDescriptionWithData:(NSData *)data {
    NSMutableString *description = [NSMutableString string];

    [description appendFormat:@"URL: %@\n", self.URL.absoluteString];

    if ([self isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)self;

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
        [description appendFormat:@"<Non-HTTP Response of type %@>\n", NSStringFromClass([self class])];
    }

    // Response metadata
    [description appendFormat:@"Expected Content Length: %lld\n", self.expectedContentLength];
    [description appendFormat:@"Text Encoding: %@\n", self.textEncodingName ?: @"<None>"];

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

    [description appendFormat:@"debugDescription: %@", self.debugDescription];

    return description;
}

@end
NS_ASSUME_NONNULL_END
