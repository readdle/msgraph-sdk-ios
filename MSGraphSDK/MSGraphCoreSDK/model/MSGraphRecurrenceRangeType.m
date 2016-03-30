// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphRecurrenceRangeType.h>

@implementation NSString (MSGraphRecurrenceRangeType)

+ (instancetype) stringWithMSGraphRecurrenceRangeType:(MSGraphRecurrenceRangeType)val {

    switch(val)
    {
        case MSGraphRecurrenceRangeTypeEndDate:
            return @"endDate";
        case MSGraphRecurrenceRangeTypeNoEnd:
            return @"noEnd";
        case MSGraphRecurrenceRangeTypeNumbered:
            return @"numbered";
        case MSGraphRecurrenceRangeTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphRecurrenceRangeType) toMSGraphRecurrenceRangeType{

    if([self isEqualToString:@"endDate"])
      {
            return MSGraphRecurrenceRangeTypeEndDate;
      }
      else if([self isEqualToString:@"noEnd"])
      {
            return MSGraphRecurrenceRangeTypeNoEnd;
      }
      else if([self isEqualToString:@"numbered"])
      {
            return MSGraphRecurrenceRangeTypeNumbered;
      }
      else     {
        return MSGraphRecurrenceRangeTypeEndOfEnum;
    }
}

@end
