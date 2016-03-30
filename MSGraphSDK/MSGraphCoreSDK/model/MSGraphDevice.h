// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphAlternativeSecurityId, MSGraphDirectoryObject; 
#import "MSGraphAlternativeSecurityIdCollection.h"
#import "MSCollection.h"
#import "MSGraphDirectoryObjectCollection.h"


#import "MSGraphDirectoryObject.h"
#import "MSCollection.h"

@interface MSGraphDevice : MSGraphDirectoryObject

  @property (nonatomic, setter=setAccountEnabled:, getter=accountEnabled) BOOL accountEnabled;
    @property (nonatomic, setter=setAlternativeSecurityIds:, getter=alternativeSecurityIds) MSGraphAlternativeSecurityIdCollection* alternativeSecurityIds;
    @property (nonatomic, setter=setApproximateLastSignInDateTime:, getter=approximateLastSignInDateTime) NSDate* approximateLastSignInDateTime;
    @property (nonatomic, setter=setDeviceId:, getter=deviceId) NSString* deviceId;
    @property (nonatomic, setter=setDeviceMetadata:, getter=deviceMetadata) NSString* deviceMetadata;
    @property (nonatomic, setter=setDeviceVersion:, getter=deviceVersion) int32_t deviceVersion;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setIsCompliant:, getter=isCompliant) BOOL isCompliant;
    @property (nonatomic, setter=setIsManaged:, getter=isManaged) BOOL isManaged;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setOperatingSystem:, getter=operatingSystem) NSString* operatingSystem;
    @property (nonatomic, setter=setOperatingSystemVersion:, getter=operatingSystemVersion) NSString* operatingSystemVersion;
    @property (nonatomic, setter=setPhysicalIds:, getter=physicalIds) MSCollection* physicalIds;
    @property (nonatomic, setter=setTrustType:, getter=trustType) NSString* trustType;
    @property (nonatomic, setter=setRegisteredOwners:, getter=registeredOwners) MSGraphDirectoryObjectCollection* registeredOwners;
    @property (nonatomic, setter=setRegisteredUsers:, getter=registeredUsers) MSGraphDirectoryObjectCollection* registeredUsers;
  - (MSGraphAlternativeSecurityId*) alternativeSecurityIds:(NSInteger)index;
- (NSString*) physicalIds:(NSInteger)index;
- (MSGraphDirectoryObject*) registeredOwners:(NSInteger)index;
- (MSGraphDirectoryObject*) registeredUsers:(NSInteger)index;

@end
