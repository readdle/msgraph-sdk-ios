// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphMeetingMessageType.h>

@implementation NSString (MSGraphMeetingMessageType)

+ (instancetype) stringWithMSGraphMeetingMessageType:(MSGraphMeetingMessageType)val {

    switch(val)
    {
        case MSGraphMeetingMessageTypeNone:
            return @"none";
        case MSGraphMeetingMessageTypeMeetingRequest:
            return @"meetingRequest";
        case MSGraphMeetingMessageTypeMeetingCancelled:
            return @"meetingCancelled";
        case MSGraphMeetingMessageTypeMeetingAccepted:
            return @"meetingAccepted";
        case MSGraphMeetingMessageTypeMeetingTenativelyAccepted:
            return @"meetingTenativelyAccepted";
        case MSGraphMeetingMessageTypeMeetingDeclined:
            return @"meetingDeclined";
        case MSGraphMeetingMessageTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphMeetingMessageType) toMSGraphMeetingMessageType{

    if([self isEqualToString:@"none"])
      {
            return MSGraphMeetingMessageTypeNone;
      }
      else if([self isEqualToString:@"meetingRequest"])
      {
            return MSGraphMeetingMessageTypeMeetingRequest;
      }
      else if([self isEqualToString:@"meetingCancelled"])
      {
            return MSGraphMeetingMessageTypeMeetingCancelled;
      }
      else if([self isEqualToString:@"meetingAccepted"])
      {
            return MSGraphMeetingMessageTypeMeetingAccepted;
      }
      else if([self isEqualToString:@"meetingTenativelyAccepted"])
      {
            return MSGraphMeetingMessageTypeMeetingTenativelyAccepted;
      }
      else if([self isEqualToString:@"meetingDeclined"])
      {
            return MSGraphMeetingMessageTypeMeetingDeclined;
      }
      else     {
        return MSGraphMeetingMessageTypeEndOfEnum;
    }
}

@end
