// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphWeekIndex.h>

@implementation NSString (MSGraphWeekIndex)

+ (instancetype) stringWithMSGraphWeekIndex:(MSGraphWeekIndex)val {

    switch(val)
    {
        case MSGraphWeekIndexFirst:
            return @"first";
        case MSGraphWeekIndexSecond:
            return @"second";
        case MSGraphWeekIndexThird:
            return @"third";
        case MSGraphWeekIndexFourth:
            return @"fourth";
        case MSGraphWeekIndexLast:
            return @"last";
        case MSGraphWeekIndexEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphWeekIndex) toMSGraphWeekIndex{

    if([self isEqualToString:@"first"])
      {
            return MSGraphWeekIndexFirst;
      }
      else if([self isEqualToString:@"second"])
      {
            return MSGraphWeekIndexSecond;
      }
      else if([self isEqualToString:@"third"])
      {
            return MSGraphWeekIndexThird;
      }
      else if([self isEqualToString:@"fourth"])
      {
            return MSGraphWeekIndexFourth;
      }
      else if([self isEqualToString:@"last"])
      {
            return MSGraphWeekIndexLast;
      }
      else     {
        return MSGraphWeekIndexEndOfEnum;
    }
}

@end
