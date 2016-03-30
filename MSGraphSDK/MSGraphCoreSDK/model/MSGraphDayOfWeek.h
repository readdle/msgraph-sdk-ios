// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphDayOfWeek){

	MSGraphDayOfWeekSunday = 0,
	MSGraphDayOfWeekMonday = 1,
	MSGraphDayOfWeekTuesday = 2,
	MSGraphDayOfWeekWednesday = 3,
	MSGraphDayOfWeekThursday = 4,
	MSGraphDayOfWeekFriday = 5,
	MSGraphDayOfWeekSaturday = 6,
    MSGraphDayOfWeekEndOfEnum
};

@interface NSString (MSGraphDayOfWeek)

+ (instancetype) stringWithMSGraphDayOfWeek:(MSGraphDayOfWeek)val;
- (MSGraphDayOfWeek) toMSGraphDayOfWeek;

@end
