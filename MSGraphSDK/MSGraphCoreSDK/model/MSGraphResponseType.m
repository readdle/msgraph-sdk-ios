// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphResponseType.h>

@implementation NSString (MSGraphResponseType)

+ (instancetype) stringWithMSGraphResponseType:(MSGraphResponseType)val {

    switch(val)
    {
        case MSGraphResponseTypeNone:
            return @"none";
        case MSGraphResponseTypeOrganizer:
            return @"organizer";
        case MSGraphResponseTypeTentativelyAccepted:
            return @"tentativelyAccepted";
        case MSGraphResponseTypeAccepted:
            return @"accepted";
        case MSGraphResponseTypeDeclined:
            return @"declined";
        case MSGraphResponseTypeNotResponded:
            return @"notResponded";
        case MSGraphResponseTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphResponseType) toMSGraphResponseType{

    if([self isEqualToString:@"none"])
      {
            return MSGraphResponseTypeNone;
      }
      else if([self isEqualToString:@"organizer"])
      {
            return MSGraphResponseTypeOrganizer;
      }
      else if([self isEqualToString:@"tentativelyAccepted"])
      {
            return MSGraphResponseTypeTentativelyAccepted;
      }
      else if([self isEqualToString:@"accepted"])
      {
            return MSGraphResponseTypeAccepted;
      }
      else if([self isEqualToString:@"declined"])
      {
            return MSGraphResponseTypeDeclined;
      }
      else if([self isEqualToString:@"notResponded"])
      {
            return MSGraphResponseTypeNotResponded;
      }
      else     {
        return MSGraphResponseTypeEndOfEnum;
    }
}

@end
