// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDevice()
{
    BOOL _accountEnabled;
    MSGraphAlternativeSecurityIdCollection* _alternativeSecurityIds;
    NSDate* _approximateLastSignInDateTime;
    NSString* _deviceId;
    NSString* _deviceMetadata;
    int32_t _deviceVersion;
    NSString* _displayName;
    BOOL _isCompliant;
    BOOL _isManaged;
    NSDate* _onPremisesLastSyncDateTime;
    BOOL _onPremisesSyncEnabled;
    NSString* _operatingSystem;
    NSString* _operatingSystemVersion;
    MSCollection* _physicalIds;
    NSString* _trustType;
    MSGraphDirectoryObjectCollection* _registeredOwners;
    MSGraphDirectoryObjectCollection* _registeredUsers;
}
@end

@implementation MSGraphDevice

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.device";
    }
    return self;
}
- (BOOL) accountEnabled
{
    _accountEnabled = [self.dictionary[@"accountEnabled"] boolValue];
    return _accountEnabled;
}
- (void) setAccountEnabled: (BOOL) val
{
    _accountEnabled = val;
    self.dictionary[@"accountEnabled"] = @(val);
}
- (MSGraphAlternativeSecurityIdCollection*) alternativeSecurityIds
{
    if(!_alternativeSecurityIds){
        
    NSMutableArray *alternativeSecurityIdsCollection = [NSMutableArray array];
    NSArray *alternativeSecurityIdss = self.dictionary[@"alternativeSecurityIds"];

    if ([alternativeSecurityIdss isKindOfClass:[NSArray class]]){
        for (id alternativeSecurityIds in alternativeSecurityIdss){
            [alternativeSecurityIdsCollection addObject:alternativeSecurityIds];
         }
    }

    if ([alternativeSecurityIdsCollection count] > 0){
        _alternativeSecurityIds = [[MSGraphAlternativeSecurityIdCollection alloc] initWithArray:alternativeSecurityIdsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _alternativeSecurityIds;
}
- (void) setAlternativeSecurityIds: (MSGraphAlternativeSecurityIdCollection*) val
{
    _alternativeSecurityIds = val;
    self.dictionary[@"alternativeSecurityIds"] = val;
}
- (NSDate*) approximateLastSignInDateTime
{
    if(!_approximateLastSignInDateTime){
        _approximateLastSignInDateTime = [NSDate ms_dateFromString: self.dictionary[@"approximateLastSignInDateTime"]];
    }
    return _approximateLastSignInDateTime;
}
- (void) setApproximateLastSignInDateTime: (NSDate*) val
{
    _approximateLastSignInDateTime = val;
    self.dictionary[@"approximateLastSignInDateTime"] = val;
}
- (NSString*) deviceId
{
    return self.dictionary[@"deviceId"];
}
- (void) setDeviceId: (NSString*) val
{
    self.dictionary[@"deviceId"] = val;
}
- (NSString*) deviceMetadata
{
    return self.dictionary[@"deviceMetadata"];
}
- (void) setDeviceMetadata: (NSString*) val
{
    self.dictionary[@"deviceMetadata"] = val;
}
- (int32_t) deviceVersion
{
    _deviceVersion = [self.dictionary[@"deviceVersion"] intValue];
    return _deviceVersion;
}
- (void) setDeviceVersion: (int32_t) val
{
    _deviceVersion = val;
    self.dictionary[@"deviceVersion"] = @(val);
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (BOOL) isCompliant
{
    _isCompliant = [self.dictionary[@"isCompliant"] boolValue];
    return _isCompliant;
}
- (void) setIsCompliant: (BOOL) val
{
    _isCompliant = val;
    self.dictionary[@"isCompliant"] = @(val);
}
- (BOOL) isManaged
{
    _isManaged = [self.dictionary[@"isManaged"] boolValue];
    return _isManaged;
}
- (void) setIsManaged: (BOOL) val
{
    _isManaged = val;
    self.dictionary[@"isManaged"] = @(val);
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
- (NSString*) operatingSystem
{
    return self.dictionary[@"operatingSystem"];
}
- (void) setOperatingSystem: (NSString*) val
{
    self.dictionary[@"operatingSystem"] = val;
}
- (NSString*) operatingSystemVersion
{
    return self.dictionary[@"operatingSystemVersion"];
}
- (void) setOperatingSystemVersion: (NSString*) val
{
    self.dictionary[@"operatingSystemVersion"] = val;
}
- (MSCollection*) physicalIds
{
    return self.dictionary[@"physicalIds"];
}
- (void) setPhysicalIds: (MSCollection*) val
{
    self.dictionary[@"physicalIds"] = val;
}
- (NSString*) trustType
{
    return self.dictionary[@"trustType"];
}
- (void) setTrustType: (NSString*) val
{
    self.dictionary[@"trustType"] = val;
}
- (MSGraphDirectoryObjectCollection*) registeredOwners
{
    if(!_registeredOwners){
        
    NSMutableArray *registeredOwnersCollection = [NSMutableArray array];
    NSArray *registeredOwnerss = self.dictionary[@"registeredOwners"];

    if ([registeredOwnerss isKindOfClass:[NSArray class]]){
        for (id registeredOwners in registeredOwnerss){
            [registeredOwnersCollection addObject:registeredOwners];
         }
    }

    if ([registeredOwnersCollection count] > 0){
        _registeredOwners = [[MSGraphDirectoryObjectCollection alloc] initWithArray:registeredOwnersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _registeredOwners;
}
- (void) setRegisteredOwners: (MSGraphDirectoryObjectCollection*) val
{
    _registeredOwners = val;
    self.dictionary[@"registeredOwners"] = val;
}
- (MSGraphDirectoryObjectCollection*) registeredUsers
{
    if(!_registeredUsers){
        
    NSMutableArray *registeredUsersCollection = [NSMutableArray array];
    NSArray *registeredUserss = self.dictionary[@"registeredUsers"];

    if ([registeredUserss isKindOfClass:[NSArray class]]){
        for (id registeredUsers in registeredUserss){
            [registeredUsersCollection addObject:registeredUsers];
         }
    }

    if ([registeredUsersCollection count] > 0){
        _registeredUsers = [[MSGraphDirectoryObjectCollection alloc] initWithArray:registeredUsersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _registeredUsers;
}
- (void) setRegisteredUsers: (MSGraphDirectoryObjectCollection*) val
{
    _registeredUsers = val;
    self.dictionary[@"registeredUsers"] = val;
}
- (MSGraphAlternativeSecurityId*) alternativeSecurityIds:(NSInteger)index
{
   MSGraphAlternativeSecurityId* alternativeSecurityIds = nil;
   if (self.alternativeSecurityIds.value){
       alternativeSecurityIds = self.alternativeSecurityIds.value[index];
   }
   return alternativeSecurityIds;
}
- (NSString*) physicalIds:(NSInteger)index
{
   NSString* physicalIds = nil;
   if (self.physicalIds.value){
       physicalIds = self.physicalIds.value[index];
   }
   return physicalIds;
}
- (MSGraphDirectoryObject*) registeredOwners:(NSInteger)index
{
   MSGraphDirectoryObject* registeredOwners = nil;
   if (self.registeredOwners.value){
       registeredOwners = self.registeredOwners.value[index];
   }
   return registeredOwners;
}
- (MSGraphDirectoryObject*) registeredUsers:(NSInteger)index
{
   MSGraphDirectoryObject* registeredUsers = nil;
   if (self.registeredUsers.value){
       registeredUsers = self.registeredUsers.value[index];
   }
   return registeredUsers;
}

@end
