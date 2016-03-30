// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphEventType){

	MSGraphEventTypeSingleInstance = 0,
	MSGraphEventTypeOccurrence = 1,
	MSGraphEventTypeException = 2,
	MSGraphEventTypeSeriesMaster = 3,
    MSGraphEventTypeEndOfEnum
};

@interface NSString (MSGraphEventType)

+ (instancetype) stringWithMSGraphEventType:(MSGraphEventType)val;
- (MSGraphEventType) toMSGraphEventType;

@end
