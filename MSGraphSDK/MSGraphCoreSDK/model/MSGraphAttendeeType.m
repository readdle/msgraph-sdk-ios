// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphAttendeeType.h>

@implementation NSString (MSGraphAttendeeType)

+ (instancetype) stringWithMSGraphAttendeeType:(MSGraphAttendeeType)val {

    switch(val)
    {
        case MSGraphAttendeeTypeRequired:
            return @"required";
        case MSGraphAttendeeTypeOptional:
            return @"optional";
        case MSGraphAttendeeTypeResource:
            return @"resource";
        case MSGraphAttendeeTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphAttendeeType) toMSGraphAttendeeType{

    if([self isEqualToString:@"required"])
      {
            return MSGraphAttendeeTypeRequired;
      }
      else if([self isEqualToString:@"optional"])
      {
            return MSGraphAttendeeTypeOptional;
      }
      else if([self isEqualToString:@"resource"])
      {
            return MSGraphAttendeeTypeResource;
      }
      else     {
        return MSGraphAttendeeTypeEndOfEnum;
    }
}

@end
