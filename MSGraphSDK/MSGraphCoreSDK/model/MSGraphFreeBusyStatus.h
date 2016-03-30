// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphFreeBusyStatus){

	MSGraphFreeBusyStatusUnknown = -1,
	MSGraphFreeBusyStatusFree = 0,
	MSGraphFreeBusyStatusTentative = 1,
	MSGraphFreeBusyStatusBusy = 2,
	MSGraphFreeBusyStatusOof = 3,
	MSGraphFreeBusyStatusWorkingElsewhere = 4,
    MSGraphFreeBusyStatusEndOfEnum
};

@interface NSString (MSGraphFreeBusyStatus)

+ (instancetype) stringWithMSGraphFreeBusyStatus:(MSGraphFreeBusyStatus)val;
- (MSGraphFreeBusyStatus) toMSGraphFreeBusyStatus;

@end
