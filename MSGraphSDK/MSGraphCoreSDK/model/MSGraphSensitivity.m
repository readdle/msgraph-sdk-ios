// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#include <MSGraphSensitivity.h>

@implementation NSString (MSGraphSensitivity)

+ (instancetype) stringWithMSGraphSensitivity:(MSGraphSensitivity)val {

    switch(val)
    {
        case MSGraphSensitivityNormal:
            return @"normal";
        case MSGraphSensitivityPersonal:
            return @"personal";
        case MSGraphSensitivityPrivate:
            return @"private";
        case MSGraphSensitivityConfidential:
            return @"confidential";
        case MSGraphSensitivityEndOfEnum:
        default:
            return nil;
    }

    return nil;
}

- (MSGraphSensitivity) toMSGraphSensitivity{

    if([self isEqualToString:@"normal"])
      {
            return MSGraphSensitivityNormal;
      }
      else if([self isEqualToString:@"personal"])
      {
            return MSGraphSensitivityPersonal;
      }
      else if([self isEqualToString:@"private"])
      {
            return MSGraphSensitivityPrivate;
      }
      else if([self isEqualToString:@"confidential"])
      {
            return MSGraphSensitivityConfidential;
      }
      else     {
        return MSGraphSensitivityEndOfEnum;
    }
}

@end
