// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphImportance.h>

@implementation NSString (MSGraphImportance)

+ (instancetype) stringWithMSGraphImportance:(MSGraphImportance)val {

    switch(val)
    {
        case MSGraphImportanceLow:
            return @"low";
        case MSGraphImportanceNormal:
            return @"normal";
        case MSGraphImportanceHigh:
            return @"high";
        case MSGraphImportanceEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphImportance) toMSGraphImportance{

    if([self isEqualToString:@"low"])
      {
            return MSGraphImportanceLow;
      }
      else if([self isEqualToString:@"normal"])
      {
            return MSGraphImportanceNormal;
      }
      else if([self isEqualToString:@"high"])
      {
            return MSGraphImportanceHigh;
      }
      else     {
        return MSGraphImportanceEndOfEnum;
    }
}

@end
