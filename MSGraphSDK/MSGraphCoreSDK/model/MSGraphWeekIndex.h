// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphWeekIndex){

	MSGraphWeekIndexFirst = 0,
	MSGraphWeekIndexSecond = 1,
	MSGraphWeekIndexThird = 2,
	MSGraphWeekIndexFourth = 3,
	MSGraphWeekIndexLast = 4,
    MSGraphWeekIndexEndOfEnum
};

@interface NSString (MSGraphWeekIndex)

+ (instancetype) stringWithMSGraphWeekIndex:(MSGraphWeekIndex)val;
- (MSGraphWeekIndex) toMSGraphWeekIndex;

@end
