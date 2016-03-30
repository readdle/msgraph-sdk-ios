// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphCalendar;

@interface MSGraphCalendarCollection : MSCollection

+ (MSGraphCalendarCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphCalendar*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
