// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphCalendarColor.h>

@implementation NSString (MSGraphCalendarColor)

+ (instancetype) stringWithMSGraphCalendarColor:(MSGraphCalendarColor)val {

    switch(val)
    {
        case MSGraphCalendarColorLightBlue:
            return @"lightBlue";
        case MSGraphCalendarColorLightGreen:
            return @"lightGreen";
        case MSGraphCalendarColorLightOrange:
            return @"lightOrange";
        case MSGraphCalendarColorLightGray:
            return @"lightGray";
        case MSGraphCalendarColorLightYellow:
            return @"lightYellow";
        case MSGraphCalendarColorLightTeal:
            return @"lightTeal";
        case MSGraphCalendarColorLightPink:
            return @"lightPink";
        case MSGraphCalendarColorLightBrown:
            return @"lightBrown";
        case MSGraphCalendarColorLightRed:
            return @"lightRed";
        case MSGraphCalendarColorMaxColor:
            return @"maxColor";
        case MSGraphCalendarColorAuto:
            return @"auto";
        case MSGraphCalendarColorEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphCalendarColor) toMSGraphCalendarColor{

    if([self isEqualToString:@"lightBlue"])
      {
            return MSGraphCalendarColorLightBlue;
      }
      else if([self isEqualToString:@"lightGreen"])
      {
            return MSGraphCalendarColorLightGreen;
      }
      else if([self isEqualToString:@"lightOrange"])
      {
            return MSGraphCalendarColorLightOrange;
      }
      else if([self isEqualToString:@"lightGray"])
      {
            return MSGraphCalendarColorLightGray;
      }
      else if([self isEqualToString:@"lightYellow"])
      {
            return MSGraphCalendarColorLightYellow;
      }
      else if([self isEqualToString:@"lightTeal"])
      {
            return MSGraphCalendarColorLightTeal;
      }
      else if([self isEqualToString:@"lightPink"])
      {
            return MSGraphCalendarColorLightPink;
      }
      else if([self isEqualToString:@"lightBrown"])
      {
            return MSGraphCalendarColorLightBrown;
      }
      else if([self isEqualToString:@"lightRed"])
      {
            return MSGraphCalendarColorLightRed;
      }
      else if([self isEqualToString:@"maxColor"])
      {
            return MSGraphCalendarColorMaxColor;
      }
      else if([self isEqualToString:@"auto"])
      {
            return MSGraphCalendarColorAuto;
      }
      else     {
        return MSGraphCalendarColorEndOfEnum;
    }
}

@end
