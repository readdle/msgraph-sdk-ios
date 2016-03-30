// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphRecurrenceRangeType){

	MSGraphRecurrenceRangeTypeEndDate = 0,
	MSGraphRecurrenceRangeTypeNoEnd = 1,
	MSGraphRecurrenceRangeTypeNumbered = 2,
    MSGraphRecurrenceRangeTypeEndOfEnum
};

@interface NSString (MSGraphRecurrenceRangeType)

+ (instancetype) stringWithMSGraphRecurrenceRangeType:(MSGraphRecurrenceRangeType)val;
- (MSGraphRecurrenceRangeType) toMSGraphRecurrenceRangeType;

@end
