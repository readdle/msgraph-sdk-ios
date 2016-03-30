// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphBodyType){

	MSGraphBodyTypeText = 0,
	MSGraphBodyTypeHtml = 1,
    MSGraphBodyTypeEndOfEnum
};

@interface NSString (MSGraphBodyType)

+ (instancetype) stringWithMSGraphBodyType:(MSGraphBodyType)val;
- (MSGraphBodyType) toMSGraphBodyType;

@end
