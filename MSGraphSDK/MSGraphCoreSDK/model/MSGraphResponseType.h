// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphResponseType){

	MSGraphResponseTypeNone = 0,
	MSGraphResponseTypeOrganizer = 1,
	MSGraphResponseTypeTentativelyAccepted = 2,
	MSGraphResponseTypeAccepted = 3,
	MSGraphResponseTypeDeclined = 4,
	MSGraphResponseTypeNotResponded = 5,
    MSGraphResponseTypeEndOfEnum
};

@interface NSString (MSGraphResponseType)

+ (instancetype) stringWithMSGraphResponseType:(MSGraphResponseType)val;
- (MSGraphResponseType) toMSGraphResponseType;

@end
