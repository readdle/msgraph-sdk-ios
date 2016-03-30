// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphBodyType.h>

@implementation NSString (MSGraphBodyType)

+ (instancetype) stringWithMSGraphBodyType:(MSGraphBodyType)val {

    switch(val)
    {
        case MSGraphBodyTypeText:
            return @"text";
        case MSGraphBodyTypeHtml:
            return @"html";
        case MSGraphBodyTypeEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphBodyType) toMSGraphBodyType{

    if([self isEqualToString:@"text"])
      {
            return MSGraphBodyTypeText;
      }
      else if([self isEqualToString:@"html"])
      {
            return MSGraphBodyTypeHtml;
      }
      else     {
        return MSGraphBodyTypeEndOfEnum;
    }
}

@end
