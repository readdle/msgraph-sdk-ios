// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphAssignedLicense, MSGraphAssignedPlan, MSGraphPasswordProfile, MSGraphProvisionedPlan, MSGraphDirectoryObject, MSGraphMessage, MSGraphMailFolder, MSGraphCalendar, MSGraphCalendarGroup, MSGraphEvent, MSGraphContact, MSGraphContactFolder, MSGraphProfilePhoto, MSGraphDrive; 
#import "MSGraphAssignedLicenseCollection.h"
#import "MSGraphAssignedPlanCollection.h"
#import "MSCollection.h"
#import "MSGraphProvisionedPlanCollection.h"
#import "MSGraphDirectoryObjectCollection.h"
#import "MSGraphMessageCollection.h"
#import "MSGraphMailFolderCollection.h"
#import "MSGraphCalendarCollection.h"
#import "MSGraphCalendarGroupCollection.h"
#import "MSGraphEventCollection.h"
#import "MSGraphContactCollection.h"
#import "MSGraphContactFolderCollection.h"


#import "MSGraphDirectoryObject.h"
#import "MSCollection.h"

@interface MSGraphUser : MSGraphDirectoryObject

  @property (nonatomic, setter=setAccountEnabled:, getter=accountEnabled) BOOL accountEnabled;
    @property (nonatomic, setter=setAssignedLicenses:, getter=assignedLicenses) MSGraphAssignedLicenseCollection* assignedLicenses;
    @property (nonatomic, setter=setAssignedPlans:, getter=assignedPlans) MSGraphAssignedPlanCollection* assignedPlans;
    @property (nonatomic, setter=setBusinessPhones:, getter=businessPhones) MSCollection* businessPhones;
    @property (nonatomic, setter=setCity:, getter=city) NSString* city;
    @property (nonatomic, setter=setCompanyName:, getter=companyName) NSString* companyName;
    @property (nonatomic, setter=setCountry:, getter=country) NSString* country;
    @property (nonatomic, setter=setDepartment:, getter=department) NSString* department;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setGivenName:, getter=givenName) NSString* givenName;
    @property (nonatomic, setter=setJobTitle:, getter=jobTitle) NSString* jobTitle;
    @property (nonatomic, setter=setMail:, getter=mail) NSString* mail;
    @property (nonatomic, setter=setMailNickname:, getter=mailNickname) NSString* mailNickname;
    @property (nonatomic, setter=setMobilePhone:, getter=mobilePhone) NSString* mobilePhone;
    @property (nonatomic, setter=setOnPremisesImmutableId:, getter=onPremisesImmutableId) NSString* onPremisesImmutableId;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSecurityIdentifier:, getter=onPremisesSecurityIdentifier) NSString* onPremisesSecurityIdentifier;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setPasswordPolicies:, getter=passwordPolicies) NSString* passwordPolicies;
    @property (nonatomic, setter=setPasswordProfile:, getter=passwordProfile) MSGraphPasswordProfile* passwordProfile;
    @property (nonatomic, setter=setOfficeLocation:, getter=officeLocation) NSString* officeLocation;
    @property (nonatomic, setter=setPostalCode:, getter=postalCode) NSString* postalCode;
    @property (nonatomic, setter=setPreferredLanguage:, getter=preferredLanguage) NSString* preferredLanguage;
    @property (nonatomic, setter=setProvisionedPlans:, getter=provisionedPlans) MSGraphProvisionedPlanCollection* provisionedPlans;
    @property (nonatomic, setter=setProxyAddresses:, getter=proxyAddresses) MSCollection* proxyAddresses;
    @property (nonatomic, setter=setState:, getter=state) NSString* state;
    @property (nonatomic, setter=setStreetAddress:, getter=streetAddress) NSString* streetAddress;
    @property (nonatomic, setter=setSurname:, getter=surname) NSString* surname;
    @property (nonatomic, setter=setUsageLocation:, getter=usageLocation) NSString* usageLocation;
    @property (nonatomic, setter=setUserPrincipalName:, getter=userPrincipalName) NSString* userPrincipalName;
    @property (nonatomic, setter=setUserType:, getter=userType) NSString* userType;
    @property (nonatomic, setter=setAboutMe:, getter=aboutMe) NSString* aboutMe;
    @property (nonatomic, setter=setBirthday:, getter=birthday) NSDate* birthday;
    @property (nonatomic, setter=setHireDate:, getter=hireDate) NSDate* hireDate;
    @property (nonatomic, setter=setInterests:, getter=interests) MSCollection* interests;
    @property (nonatomic, setter=setMySite:, getter=mySite) NSString* mySite;
    @property (nonatomic, setter=setPastProjects:, getter=pastProjects) MSCollection* pastProjects;
    @property (nonatomic, setter=setPreferredName:, getter=preferredName) NSString* preferredName;
    @property (nonatomic, setter=setResponsibilities:, getter=responsibilities) MSCollection* responsibilities;
    @property (nonatomic, setter=setSchools:, getter=schools) MSCollection* schools;
    @property (nonatomic, setter=setSkills:, getter=skills) MSCollection* skills;
    @property (nonatomic, setter=setOwnedDevices:, getter=ownedDevices) MSGraphDirectoryObjectCollection* ownedDevices;
    @property (nonatomic, setter=setRegisteredDevices:, getter=registeredDevices) MSGraphDirectoryObjectCollection* registeredDevices;
    @property (nonatomic, setter=setManager:, getter=manager) MSGraphDirectoryObject* manager;
    @property (nonatomic, setter=setDirectReports:, getter=directReports) MSGraphDirectoryObjectCollection* directReports;
    @property (nonatomic, setter=setMemberOf:, getter=memberOf) MSGraphDirectoryObjectCollection* memberOf;
    @property (nonatomic, setter=setCreatedObjects:, getter=createdObjects) MSGraphDirectoryObjectCollection* createdObjects;
    @property (nonatomic, setter=setOwnedObjects:, getter=ownedObjects) MSGraphDirectoryObjectCollection* ownedObjects;
    @property (nonatomic, setter=setMessages:, getter=messages) MSGraphMessageCollection* messages;
    @property (nonatomic, setter=setMailFolders:, getter=mailFolders) MSGraphMailFolderCollection* mailFolders;
    @property (nonatomic, setter=setCalendar:, getter=calendar) MSGraphCalendar* calendar;
    @property (nonatomic, setter=setCalendars:, getter=calendars) MSGraphCalendarCollection* calendars;
    @property (nonatomic, setter=setCalendarGroups:, getter=calendarGroups) MSGraphCalendarGroupCollection* calendarGroups;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) MSGraphEventCollection* calendarView;
    @property (nonatomic, setter=setEvents:, getter=events) MSGraphEventCollection* events;
    @property (nonatomic, setter=setContacts:, getter=contacts) MSGraphContactCollection* contacts;
    @property (nonatomic, setter=setContactFolders:, getter=contactFolders) MSGraphContactFolderCollection* contactFolders;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphProfilePhoto* photo;
    @property (nonatomic, setter=setDrive:, getter=drive) MSGraphDrive* drive;
  - (MSGraphAssignedLicense*) assignedLicenses:(NSInteger)index;
- (MSGraphAssignedPlan*) assignedPlans:(NSInteger)index;
- (NSString*) businessPhones:(NSInteger)index;
- (MSGraphProvisionedPlan*) provisionedPlans:(NSInteger)index;
- (NSString*) proxyAddresses:(NSInteger)index;
- (NSString*) interests:(NSInteger)index;
- (NSString*) pastProjects:(NSInteger)index;
- (NSString*) responsibilities:(NSInteger)index;
- (NSString*) schools:(NSInteger)index;
- (NSString*) skills:(NSInteger)index;
- (MSGraphDirectoryObject*) ownedDevices:(NSInteger)index;
- (MSGraphDirectoryObject*) registeredDevices:(NSInteger)index;
- (MSGraphDirectoryObject*) directReports:(NSInteger)index;
- (MSGraphDirectoryObject*) memberOf:(NSInteger)index;
- (MSGraphDirectoryObject*) createdObjects:(NSInteger)index;
- (MSGraphDirectoryObject*) ownedObjects:(NSInteger)index;
- (MSGraphMessage*) messages:(NSInteger)index;
- (MSGraphMailFolder*) mailFolders:(NSInteger)index;
- (MSGraphCalendar*) calendars:(NSInteger)index;
- (MSGraphCalendarGroup*) calendarGroups:(NSInteger)index;
- (MSGraphEvent*) calendarView:(NSInteger)index;
- (MSGraphEvent*) events:(NSInteger)index;
- (MSGraphContact*) contacts:(NSInteger)index;
- (MSGraphContactFolder*) contactFolders:(NSInteger)index;

@end
