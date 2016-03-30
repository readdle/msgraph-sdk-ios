// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphRecurrencePatternType.h>

@implementation NSString (MSGraphRecurrencePatternType)

+ (instancetype) stringWithMSGraphRecurrencePatternType:(MSGraphRecurrencePatternType)val {

    switch(val)
    {
        case MSGraphRecurrencePatternTypeDaily:
            return @"daily";
        case MSGraphRecurrencePatternTypeWeekly:
            return @"weekly";
        case MSGraphRecurrencePatternTypeAbsoluteMonthly:
            return @"absoluteMonthly";
        case MSGraphRecurrencePatternTypeRelativeMonthly:
            return @"relativeMonthly";
        case MSGraphRecurrencePatternTypeAbsoluteYearly:
            return @"absoluteYearly";
        case MSGraphRecurrencePatternTypeRelativeYearly:
            return @"relativeYearly";
        case MSGraphRecurrencePatternTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphRecurrencePatternType) toMSGraphRecurrencePatternType{

    if([self isEqualToString:@"daily"])
      {
            return MSGraphRecurrencePatternTypeDaily;
      }
      else if([self isEqualToString:@"weekly"])
      {
            return MSGraphRecurrencePatternTypeWeekly;
      }
      else if([self isEqualToString:@"absoluteMonthly"])
      {
            return MSGraphRecurrencePatternTypeAbsoluteMonthly;
      }
      else if([self isEqualToString:@"relativeMonthly"])
      {
            return MSGraphRecurrencePatternTypeRelativeMonthly;
      }
      else if([self isEqualToString:@"absoluteYearly"])
      {
            return MSGraphRecurrencePatternTypeAbsoluteYearly;
      }
      else if([self isEqualToString:@"relativeYearly"])
      {
            return MSGraphRecurrencePatternTypeRelativeYearly;
      }
      else     {
        return MSGraphRecurrencePatternTypeEndOfEnum;
    }
}

@end
