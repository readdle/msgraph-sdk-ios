// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphGroup;

@interface MSGraphGroupCollection : MSCollection

+ (MSGraphGroupCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphGroup*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
