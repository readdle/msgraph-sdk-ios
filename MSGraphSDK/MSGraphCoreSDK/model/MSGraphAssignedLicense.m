// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphAssignedLicense()
{
    MSCollection* _disabledPlans;
    NSString* _skuId;
}
@end

@implementation MSGraphAssignedLicense

- (MSCollection*) disabledPlans
{
    return self.dictionary[@"disabledPlans"];
}
- (void) setDisabledPlans: (MSCollection*) val
{
    self.dictionary[@"disabledPlans"] = val;
}
- (NSString*) skuId
{
    return self.dictionary[@"skuId"];
}
- (void) setSkuId: (NSString*) val
{
    self.dictionary[@"skuId"] = val;
}
@end
