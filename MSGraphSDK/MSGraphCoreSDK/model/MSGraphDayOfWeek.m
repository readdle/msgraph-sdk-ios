// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphDayOfWeek.h>

@implementation NSString (MSGraphDayOfWeek)

+ (instancetype) stringWithMSGraphDayOfWeek:(MSGraphDayOfWeek)val {

    switch(val)
    {
        case MSGraphDayOfWeekSunday:
            return @"sunday";
        case MSGraphDayOfWeekMonday:
            return @"monday";
        case MSGraphDayOfWeekTuesday:
            return @"tuesday";
        case MSGraphDayOfWeekWednesday:
            return @"wednesday";
        case MSGraphDayOfWeekThursday:
            return @"thursday";
        case MSGraphDayOfWeekFriday:
            return @"friday";
        case MSGraphDayOfWeekSaturday:
            return @"saturday";
        case MSGraphDayOfWeekEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphDayOfWeek) toMSGraphDayOfWeek{

    if([self isEqualToString:@"sunday"])
      {
            return MSGraphDayOfWeekSunday;
      }
      else if([self isEqualToString:@"monday"])
      {
            return MSGraphDayOfWeekMonday;
      }
      else if([self isEqualToString:@"tuesday"])
      {
            return MSGraphDayOfWeekTuesday;
      }
      else if([self isEqualToString:@"wednesday"])
      {
            return MSGraphDayOfWeekWednesday;
      }
      else if([self isEqualToString:@"thursday"])
      {
            return MSGraphDayOfWeekThursday;
      }
      else if([self isEqualToString:@"friday"])
      {
            return MSGraphDayOfWeekFriday;
      }
      else if([self isEqualToString:@"saturday"])
      {
            return MSGraphDayOfWeekSaturday;
      }
      else     {
        return MSGraphDayOfWeekEndOfEnum;
    }
}

@end
