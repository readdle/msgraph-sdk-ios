// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
#import "MSGraphDayOfWeek.h"

@interface MSGraphDayOfWeekCollection : MSCollection

+ (MSGraphDayOfWeekCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDayOfWeek) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
