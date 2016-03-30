// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphEventType.h>

@implementation NSString (MSGraphEventType)

+ (instancetype) stringWithMSGraphEventType:(MSGraphEventType)val {

    switch(val)
    {
        case MSGraphEventTypeSingleInstance:
            return @"singleInstance";
        case MSGraphEventTypeOccurrence:
            return @"occurrence";
        case MSGraphEventTypeException:
            return @"exception";
        case MSGraphEventTypeSeriesMaster:
            return @"seriesMaster";
        case MSGraphEventTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphEventType) toMSGraphEventType{

    if([self isEqualToString:@"singleInstance"])
      {
            return MSGraphEventTypeSingleInstance;
      }
      else if([self isEqualToString:@"occurrence"])
      {
            return MSGraphEventTypeOccurrence;
      }
      else if([self isEqualToString:@"exception"])
      {
            return MSGraphEventTypeException;
      }
      else if([self isEqualToString:@"seriesMaster"])
      {
            return MSGraphEventTypeSeriesMaster;
      }
      else     {
        return MSGraphEventTypeEndOfEnum;
    }
}

@end
