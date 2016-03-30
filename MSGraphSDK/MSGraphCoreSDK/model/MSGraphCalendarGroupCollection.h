// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphCalendarGroup;

@interface MSGraphCalendarGroupCollection : MSCollection

+ (MSGraphCalendarGroupCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphCalendarGroup*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
