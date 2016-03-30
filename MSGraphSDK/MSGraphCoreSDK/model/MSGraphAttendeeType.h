// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphAttendeeType){

	MSGraphAttendeeTypeRequired = 0,
	MSGraphAttendeeTypeOptional = 1,
	MSGraphAttendeeTypeResource = 2,
    MSGraphAttendeeTypeEndOfEnum
};

@interface NSString (MSGraphAttendeeType)

+ (instancetype) stringWithMSGraphAttendeeType:(MSGraphAttendeeType)val;
- (MSGraphAttendeeType) toMSGraphAttendeeType;

@end
