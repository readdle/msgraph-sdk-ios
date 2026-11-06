// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSTestOptions.h"

#if DEBUG
@implementation MSTestOptions

+ (instancetype)throttle
{
    // There is undocumented feature that allows adding `test429=true` parameter to receive throttling error
    // 429 is throttling error code
    return [[MSTestOptions alloc] initWithKey:@"test429" value:@"true"];
}

@end
#endif
