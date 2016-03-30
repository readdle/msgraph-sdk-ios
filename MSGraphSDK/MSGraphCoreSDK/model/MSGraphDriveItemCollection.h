// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDriveItem;

@interface MSGraphDriveItemCollection : MSCollection

+ (MSGraphDriveItemCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDriveItem*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
