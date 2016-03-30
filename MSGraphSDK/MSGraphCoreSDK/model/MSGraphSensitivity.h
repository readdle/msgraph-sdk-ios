// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphSensitivity){

	MSGraphSensitivityNormal = 0,
	MSGraphSensitivityPersonal = 1,
	MSGraphSensitivityPrivate = 2,
	MSGraphSensitivityConfidential = 3,
    MSGraphSensitivityEndOfEnum
};

@interface NSString (MSGraphSensitivity)

+ (instancetype) stringWithMSGraphSensitivity:(MSGraphSensitivity)val;
- (MSGraphSensitivity) toMSGraphSensitivity;

@end
