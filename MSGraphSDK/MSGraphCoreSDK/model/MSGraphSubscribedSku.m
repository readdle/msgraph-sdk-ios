// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphSubscribedSku()
{
    NSString* _capabilityStatus;
    int32_t _consumedUnits;
    MSGraphLicenseUnitsDetail* _prepaidUnits;
    MSGraphServicePlanInfoCollection* _servicePlans;
    NSString* _skuId;
    NSString* _skuPartNumber;
    NSString* _appliesTo;
}
@end

@implementation MSGraphSubscribedSku

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.subscribedSku";
    }
    return self;
}
- (NSString*) capabilityStatus
{
    return self.dictionary[@"capabilityStatus"];
}
- (void) setCapabilityStatus: (NSString*) val
{
    self.dictionary[@"capabilityStatus"] = val;
}
- (int32_t) consumedUnits
{
    _consumedUnits = [self.dictionary[@"consumedUnits"] intValue];
    return _consumedUnits;
}
- (void) setConsumedUnits: (int32_t) val
{
    _consumedUnits = val;
    self.dictionary[@"consumedUnits"] = @(val);
}
- (MSGraphLicenseUnitsDetail*) prepaidUnits
{
    if(!_prepaidUnits){
        _prepaidUnits = [[MSGraphLicenseUnitsDetail alloc] initWithDictionary: self.dictionary[@"prepaidUnits"] ];
    }
    return _prepaidUnits;
}
- (void) setPrepaidUnits: (MSGraphLicenseUnitsDetail*) val
{
    _prepaidUnits = val;
    self.dictionary[@"prepaidUnits"] = val;
}
- (MSGraphServicePlanInfoCollection*) servicePlans
{
    if(!_servicePlans){
        
    NSMutableArray *servicePlansCollection = [NSMutableArray array];
    NSArray *servicePlanss = self.dictionary[@"servicePlans"];

    if ([servicePlanss isKindOfClass:[NSArray class]]){
        for (id servicePlans in servicePlanss){
            [servicePlansCollection addObject:servicePlans];
         }
    }

    if ([servicePlansCollection count] > 0){
        _servicePlans = [[MSGraphServicePlanInfoCollection alloc] initWithArray:servicePlansCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _servicePlans;
}
- (void) setServicePlans: (MSGraphServicePlanInfoCollection*) val
{
    _servicePlans = val;
    self.dictionary[@"servicePlans"] = val;
}
- (NSString*) skuId
{
    return self.dictionary[@"skuId"];
}
- (void) setSkuId: (NSString*) val
{
    self.dictionary[@"skuId"] = val;
}
- (NSString*) skuPartNumber
{
    return self.dictionary[@"skuPartNumber"];
}
- (void) setSkuPartNumber: (NSString*) val
{
    self.dictionary[@"skuPartNumber"] = val;
}
- (NSString*) appliesTo
{
    return self.dictionary[@"appliesTo"];
}
- (void) setAppliesTo: (NSString*) val
{
    self.dictionary[@"appliesTo"] = val;
}
- (MSGraphServicePlanInfo*) servicePlans:(NSInteger)index
{
   MSGraphServicePlanInfo* servicePlans = nil;
   if (self.servicePlans.value){
       servicePlans = self.servicePlans.value[index];
   }
   return servicePlans;
}

@end
