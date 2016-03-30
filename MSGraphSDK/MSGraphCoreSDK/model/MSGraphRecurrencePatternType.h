// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphRecurrencePatternType){

	MSGraphRecurrencePatternTypeDaily = 0,
	MSGraphRecurrencePatternTypeWeekly = 1,
	MSGraphRecurrencePatternTypeAbsoluteMonthly = 2,
	MSGraphRecurrencePatternTypeRelativeMonthly = 3,
	MSGraphRecurrencePatternTypeAbsoluteYearly = 4,
	MSGraphRecurrencePatternTypeRelativeYearly = 5,
    MSGraphRecurrencePatternTypeEndOfEnum
};

@interface NSString (MSGraphRecurrencePatternType)

+ (instancetype) stringWithMSGraphRecurrencePatternType:(MSGraphRecurrencePatternType)val;
- (MSGraphRecurrencePatternType) toMSGraphRecurrencePatternType;

@end
