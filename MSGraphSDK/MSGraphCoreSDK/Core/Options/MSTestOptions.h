// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSQueryParameters.h"

#if DEBUG
@interface MSTestOptions : MSQueryParameters

+ (instancetype)throttle;

@end
#endif
