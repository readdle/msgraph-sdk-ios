// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphImportance){

	MSGraphImportanceLow = 0,
	MSGraphImportanceNormal = 1,
	MSGraphImportanceHigh = 2,
    MSGraphImportanceEndOfEnum
};

@interface NSString (MSGraphImportance)

+ (instancetype) stringWithMSGraphImportance:(MSGraphImportance)val;
- (MSGraphImportance) toMSGraphImportance;

@end
