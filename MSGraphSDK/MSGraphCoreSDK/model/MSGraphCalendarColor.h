// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphCalendarColor){

	MSGraphCalendarColorAuto = -1,
	MSGraphCalendarColorLightBlue = 0,
	MSGraphCalendarColorLightGreen = 1,
	MSGraphCalendarColorLightOrange = 2,
	MSGraphCalendarColorLightGray = 3,
	MSGraphCalendarColorLightYellow = 4,
	MSGraphCalendarColorLightTeal = 5,
	MSGraphCalendarColorLightPink = 6,
	MSGraphCalendarColorLightBrown = 7,
	MSGraphCalendarColorLightRed = 8,
	MSGraphCalendarColorMaxColor = 9,
    MSGraphCalendarColorEndOfEnum
};

@interface NSString (MSGraphCalendarColor)

+ (instancetype) stringWithMSGraphCalendarColor:(MSGraphCalendarColor)val;
- (MSGraphCalendarColor) toMSGraphCalendarColor;

@end
