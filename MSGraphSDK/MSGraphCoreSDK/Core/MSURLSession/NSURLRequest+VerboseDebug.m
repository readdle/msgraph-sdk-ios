//
//  NSURLRequest+NSURLRequest_VerboseDebug.m
//  MSGraphSDK
//
//  Created by Zoreslav Khimich on 13.03.2025.
//  Copyright © 2025 Microsoft. All rights reserved.
//

#import "NSURLRequest+VerboseDebug.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSURLRequest (VerboseDebug)

- (NSString *)verboseDebugDescription {
    NSMutableString *description = [NSMutableString string];

    [description appendFormat:@"%@: %@\n\n", self.HTTPMethod, self.URL.absoluteString];

    // Headers
    [description appendString:@"Headers:\n"];
    if (self.allHTTPHeaderFields.count > 0) {
        [self.allHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            [description appendFormat:@"\t%@: %@\n", key, value];
        }];
    }
    else {
        [description appendString:@"\t<None>\n"];
    }

    // Body
    if (self.HTTPBody) {
        NSString *bodyString = [[NSString alloc] initWithData:self.HTTPBody encoding:NSUTF8StringEncoding];
        if (bodyString) {
            [description appendFormat:@"Body:\n%@\n", bodyString];
        }
        else {
            [description appendFormat:@"Body:\n<non-UTF8 data, %lu bytes>\n", (unsigned long)self.HTTPBody.length];
        }
    }
    else if (self.HTTPBodyStream) {
        [description appendString:@"Body: <HTTPBodyStream present, content not directly readable>\n"];
    }
    else {
        [description appendString:@"Body: <None>\n"];
    }

    [description appendFormat:@"Timeout Interval: %.2fs\n", self.timeoutInterval];
    [description appendFormat:@"Cache Policy: %ld\n", (long)self.cachePolicy];

    [description appendFormat:@"debugDescription: %@", self.debugDescription];

    return description;
}

@end

NS_ASSUME_NONNULL_END
