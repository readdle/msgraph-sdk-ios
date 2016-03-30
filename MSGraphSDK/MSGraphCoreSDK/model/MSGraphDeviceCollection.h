// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDevice;

@interface MSGraphDeviceCollection : MSCollection

+ (MSGraphDeviceCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDevice*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
