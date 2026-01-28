// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "NSError+MSGraphSDK.h"
#import "MSConstants.h"
#import "MSError.h"

@implementation NSError (MSGraphSDK)

- (BOOL)isClientError
{
    return [self.domain isEqualToString:MSErrorDomain];
}

- (MSError *)clientError
{
    if ([self isClientError]){
        return self.userInfo[MSErrorKey];
    }
    return nil;
}

- (BOOL)isThrottlingError {
    return self.isClientError && self.code == 429;
}

- (NSNumber *)retryAfterSeconds {
    NSNumber *const retryAfterSeconds = self.userInfo[@"Retry-After"];
    if ([retryAfterSeconds isKindOfClass:NSNumber.class] &&
        retryAfterSeconds.integerValue > 0)
    {
        return retryAfterSeconds;
    }
    else {
        return nil;
    }
}

@end
