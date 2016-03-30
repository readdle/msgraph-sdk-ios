// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphFreeBusyStatus.h>

@implementation NSString (MSGraphFreeBusyStatus)

+ (instancetype) stringWithMSGraphFreeBusyStatus:(MSGraphFreeBusyStatus)val {

    switch(val)
    {
        case MSGraphFreeBusyStatusFree:
            return @"free";
        case MSGraphFreeBusyStatusTentative:
            return @"tentative";
        case MSGraphFreeBusyStatusBusy:
            return @"busy";
        case MSGraphFreeBusyStatusOof:
            return @"oof";
        case MSGraphFreeBusyStatusWorkingElsewhere:
            return @"workingElsewhere";
        case MSGraphFreeBusyStatusUnknown:
            return @"unknown";
        case MSGraphFreeBusyStatusEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphFreeBusyStatus) toMSGraphFreeBusyStatus{

    if([self isEqualToString:@"free"])
      {
            return MSGraphFreeBusyStatusFree;
      }
      else if([self isEqualToString:@"tentative"])
      {
            return MSGraphFreeBusyStatusTentative;
      }
      else if([self isEqualToString:@"busy"])
      {
            return MSGraphFreeBusyStatusBusy;
      }
      else if([self isEqualToString:@"oof"])
      {
            return MSGraphFreeBusyStatusOof;
      }
      else if([self isEqualToString:@"workingElsewhere"])
      {
            return MSGraphFreeBusyStatusWorkingElsewhere;
      }
      else if([self isEqualToString:@"unknown"])
      {
            return MSGraphFreeBusyStatusUnknown;
      }
      else     {
        return MSGraphFreeBusyStatusEndOfEnum;
    }
}

@end
