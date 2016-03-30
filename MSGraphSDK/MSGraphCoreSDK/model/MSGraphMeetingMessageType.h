// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSGraphMeetingMessageType){

	MSGraphMeetingMessageTypeNone = 0,
	MSGraphMeetingMessageTypeMeetingRequest = 1,
	MSGraphMeetingMessageTypeMeetingCancelled = 2,
	MSGraphMeetingMessageTypeMeetingAccepted = 3,
	MSGraphMeetingMessageTypeMeetingTenativelyAccepted = 4,
	MSGraphMeetingMessageTypeMeetingDeclined = 5,
    MSGraphMeetingMessageTypeEndOfEnum
};

@interface NSString (MSGraphMeetingMessageType)

+ (instancetype) stringWithMSGraphMeetingMessageType:(MSGraphMeetingMessageType)val;
- (MSGraphMeetingMessageType) toMSGraphMeetingMessageType;

@end
