// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphOrganization()
{
    MSGraphAssignedPlanCollection* _assignedPlans;
    MSCollection* _businessPhones;
    NSString* _city;
    NSString* _country;
    NSString* _countryLetterCode;
    NSString* _displayName;
    MSCollection* _marketingNotificationEmails;
    NSDate* _onPremisesLastSyncDateTime;
    BOOL _onPremisesSyncEnabled;
    NSString* _postalCode;
    NSString* _preferredLanguage;
    MSGraphProvisionedPlanCollection* _provisionedPlans;
    MSCollection* _securityComplianceNotificationMails;
    MSCollection* _securityComplianceNotificationPhones;
    NSString* _state;
    NSString* _street;
    MSCollection* _technicalNotificationMails;
    MSGraphVerifiedDomainCollection* _verifiedDomains;
}
@end

@implementation MSGraphOrganization

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.organization";
    }
    return self;
}
- (MSGraphAssignedPlanCollection*) assignedPlans
{
    if(!_assignedPlans){
        
    NSMutableArray *assignedPlansCollection = [NSMutableArray array];
    NSArray *assignedPlanss = self.dictionary[@"assignedPlans"];

    if ([assignedPlanss isKindOfClass:[NSArray class]]){
        for (id assignedPlans in assignedPlanss){
            [assignedPlansCollection addObject:assignedPlans];
         }
    }

    if ([assignedPlansCollection count] > 0){
        _assignedPlans = [[MSGraphAssignedPlanCollection alloc] initWithArray:assignedPlansCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _assignedPlans;
}
- (void) setAssignedPlans: (MSGraphAssignedPlanCollection*) val
{
    _assignedPlans = val;
    self.dictionary[@"assignedPlans"] = val;
}
- (MSCollection*) businessPhones
{
    return self.dictionary[@"businessPhones"];
}
- (void) setBusinessPhones: (MSCollection*) val
{
    self.dictionary[@"businessPhones"] = val;
}
- (NSString*) city
{
    return self.dictionary[@"city"];
}
- (void) setCity: (NSString*) val
{
    self.dictionary[@"city"] = val;
}
- (NSString*) country
{
    return self.dictionary[@"country"];
}
- (void) setCountry: (NSString*) val
{
    self.dictionary[@"country"] = val;
}
- (NSString*) countryLetterCode
{
    return self.dictionary[@"countryLetterCode"];
}
- (void) setCountryLetterCode: (NSString*) val
{
    self.dictionary[@"countryLetterCode"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (MSCollection*) marketingNotificationEmails
{
    return self.dictionary[@"marketingNotificationEmails"];
}
- (void) setMarketingNotificationEmails: (MSCollection*) val
{
    self.dictionary[@"marketingNotificationEmails"] = val;
}
- (NSDate*) onPremisesLastSyncDateTime
{
    if(!_onPremisesLastSyncDateTime){
        _onPremisesLastSyncDateTime = [NSDate ms_dateFromString: self.dictionary[@"onPremisesLastSyncDateTime"]];
    }
    return _onPremisesLastSyncDateTime;
}
- (void) setOnPremisesLastSyncDateTime: (NSDate*) val
{
    _onPremisesLastSyncDateTime = val;
    self.dictionary[@"onPremisesLastSyncDateTime"] = val;
}
- (BOOL) onPremisesSyncEnabled
{
    _onPremisesSyncEnabled = [self.dictionary[@"onPremisesSyncEnabled"] boolValue];
    return _onPremisesSyncEnabled;
}
- (void) setOnPremisesSyncEnabled: (BOOL) val
{
    _onPremisesSyncEnabled = val;
    self.dictionary[@"onPremisesSyncEnabled"] = @(val);
}
- (NSString*) postalCode
{
    return self.dictionary[@"postalCode"];
}
- (void) setPostalCode: (NSString*) val
{
    self.dictionary[@"postalCode"] = val;
}
- (NSString*) preferredLanguage
{
    return self.dictionary[@"preferredLanguage"];
}
- (void) setPreferredLanguage: (NSString*) val
{
    self.dictionary[@"preferredLanguage"] = val;
}
- (MSGraphProvisionedPlanCollection*) provisionedPlans
{
    if(!_provisionedPlans){
        
    NSMutableArray *provisionedPlansCollection = [NSMutableArray array];
    NSArray *provisionedPlanss = self.dictionary[@"provisionedPlans"];

    if ([provisionedPlanss isKindOfClass:[NSArray class]]){
        for (id provisionedPlans in provisionedPlanss){
            [provisionedPlansCollection addObject:provisionedPlans];
         }
    }

    if ([provisionedPlansCollection count] > 0){
        _provisionedPlans = [[MSGraphProvisionedPlanCollection alloc] initWithArray:provisionedPlansCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _provisionedPlans;
}
- (void) setProvisionedPlans: (MSGraphProvisionedPlanCollection*) val
{
    _provisionedPlans = val;
    self.dictionary[@"provisionedPlans"] = val;
}
- (MSCollection*) securityComplianceNotificationMails
{
    return self.dictionary[@"securityComplianceNotificationMails"];
}
- (void) setSecurityComplianceNotificationMails: (MSCollection*) val
{
    self.dictionary[@"securityComplianceNotificationMails"] = val;
}
- (MSCollection*) securityComplianceNotificationPhones
{
    return self.dictionary[@"securityComplianceNotificationPhones"];
}
- (void) setSecurityComplianceNotificationPhones: (MSCollection*) val
{
    self.dictionary[@"securityComplianceNotificationPhones"] = val;
}
- (NSString*) state
{
    return self.dictionary[@"state"];
}
- (void) setState: (NSString*) val
{
    self.dictionary[@"state"] = val;
}
- (NSString*) street
{
    return self.dictionary[@"street"];
}
- (void) setStreet: (NSString*) val
{
    self.dictionary[@"street"] = val;
}
- (MSCollection*) technicalNotificationMails
{
    return self.dictionary[@"technicalNotificationMails"];
}
- (void) setTechnicalNotificationMails: (MSCollection*) val
{
    self.dictionary[@"technicalNotificationMails"] = val;
}
- (MSGraphVerifiedDomainCollection*) verifiedDomains
{
    if(!_verifiedDomains){
        
    NSMutableArray *verifiedDomainsCollection = [NSMutableArray array];
    NSArray *verifiedDomainss = self.dictionary[@"verifiedDomains"];

    if ([verifiedDomainss isKindOfClass:[NSArray class]]){
        for (id verifiedDomains in verifiedDomainss){
            [verifiedDomainsCollection addObject:verifiedDomains];
         }
    }

    if ([verifiedDomainsCollection count] > 0){
        _verifiedDomains = [[MSGraphVerifiedDomainCollection alloc] initWithArray:verifiedDomainsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _verifiedDomains;
}
- (void) setVerifiedDomains: (MSGraphVerifiedDomainCollection*) val
{
    _verifiedDomains = val;
    self.dictionary[@"verifiedDomains"] = val;
}
- (MSGraphAssignedPlan*) assignedPlans:(NSInteger)index
{
   MSGraphAssignedPlan* assignedPlans = nil;
   if (self.assignedPlans.value){
       assignedPlans = self.assignedPlans.value[index];
   }
   return assignedPlans;
}
- (NSString*) businessPhones:(NSInteger)index
{
   NSString* businessPhones = nil;
   if (self.businessPhones.value){
       businessPhones = self.businessPhones.value[index];
   }
   return businessPhones;
}
- (NSString*) marketingNotificationEmails:(NSInteger)index
{
   NSString* marketingNotificationEmails = nil;
   if (self.marketingNotificationEmails.value){
       marketingNotificationEmails = self.marketingNotificationEmails.value[index];
   }
   return marketingNotificationEmails;
}
- (MSGraphProvisionedPlan*) provisionedPlans:(NSInteger)index
{
   MSGraphProvisionedPlan* provisionedPlans = nil;
   if (self.provisionedPlans.value){
       provisionedPlans = self.provisionedPlans.value[index];
   }
   return provisionedPlans;
}
- (NSString*) securityComplianceNotificationMails:(NSInteger)index
{
   NSString* securityComplianceNotificationMails = nil;
   if (self.securityComplianceNotificationMails.value){
       securityComplianceNotificationMails = self.securityComplianceNotificationMails.value[index];
   }
   return securityComplianceNotificationMails;
}
- (NSString*) securityComplianceNotificationPhones:(NSInteger)index
{
   NSString* securityComplianceNotificationPhones = nil;
   if (self.securityComplianceNotificationPhones.value){
       securityComplianceNotificationPhones = self.securityComplianceNotificationPhones.value[index];
   }
   return securityComplianceNotificationPhones;
}
- (NSString*) technicalNotificationMails:(NSInteger)index
{
   NSString* technicalNotificationMails = nil;
   if (self.technicalNotificationMails.value){
       technicalNotificationMails = self.technicalNotificationMails.value[index];
   }
   return technicalNotificationMails;
}
- (MSGraphVerifiedDomain*) verifiedDomains:(NSInteger)index
{
   MSGraphVerifiedDomain* verifiedDomains = nil;
   if (self.verifiedDomains.value){
       verifiedDomains = self.verifiedDomains.value[index];
   }
   return verifiedDomains;
}

@end
