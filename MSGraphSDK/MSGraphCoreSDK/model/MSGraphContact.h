// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphEmailAddress, MSGraphPhysicalAddress, MSGraphProfilePhoto; 
#import "MSGraphEmailAddressCollection.h"
#import "MSCollection.h"


#import "MSGraphOutlookItem.h"
#import "MSCollection.h"

@interface MSGraphContact : MSGraphOutlookItem

  @property (nonatomic, setter=setParentFolderId:, getter=parentFolderId) NSString* parentFolderId;
    @property (nonatomic, setter=setBirthday:, getter=birthday) NSDate* birthday;
    @property (nonatomic, setter=setFileAs:, getter=fileAs) NSString* fileAs;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setGivenName:, getter=givenName) NSString* givenName;
    @property (nonatomic, setter=setInitials:, getter=initials) NSString* initials;
    @property (nonatomic, setter=setMiddleName:, getter=middleName) NSString* middleName;
    @property (nonatomic, setter=setNickName:, getter=nickName) NSString* nickName;
    @property (nonatomic, setter=setSurname:, getter=surname) NSString* surname;
    @property (nonatomic, setter=setTitle:, getter=title) NSString* title;
    @property (nonatomic, setter=setYomiGivenName:, getter=yomiGivenName) NSString* yomiGivenName;
    @property (nonatomic, setter=setYomiSurname:, getter=yomiSurname) NSString* yomiSurname;
    @property (nonatomic, setter=setYomiCompanyName:, getter=yomiCompanyName) NSString* yomiCompanyName;
    @property (nonatomic, setter=setGeneration:, getter=generation) NSString* generation;
    @property (nonatomic, setter=setEmailAddresses:, getter=emailAddresses) MSGraphEmailAddressCollection* emailAddresses;
    @property (nonatomic, setter=setImAddresses:, getter=imAddresses) MSCollection* imAddresses;
    @property (nonatomic, setter=setJobTitle:, getter=jobTitle) NSString* jobTitle;
    @property (nonatomic, setter=setCompanyName:, getter=companyName) NSString* companyName;
    @property (nonatomic, setter=setDepartment:, getter=department) NSString* department;
    @property (nonatomic, setter=setOfficeLocation:, getter=officeLocation) NSString* officeLocation;
    @property (nonatomic, setter=setProfession:, getter=profession) NSString* profession;
    @property (nonatomic, setter=setBusinessHomePage:, getter=businessHomePage) NSString* businessHomePage;
    @property (nonatomic, setter=setAssistantName:, getter=assistantName) NSString* assistantName;
    @property (nonatomic, setter=setManager:, getter=manager) NSString* manager;
    @property (nonatomic, setter=setHomePhones:, getter=homePhones) MSCollection* homePhones;
    @property (nonatomic, setter=setMobilePhone:, getter=mobilePhone) NSString* mobilePhone;
    @property (nonatomic, setter=setBusinessPhones:, getter=businessPhones) MSCollection* businessPhones;
    @property (nonatomic, setter=setHomeAddress:, getter=homeAddress) MSGraphPhysicalAddress* homeAddress;
    @property (nonatomic, setter=setBusinessAddress:, getter=businessAddress) MSGraphPhysicalAddress* businessAddress;
    @property (nonatomic, setter=setOtherAddress:, getter=otherAddress) MSGraphPhysicalAddress* otherAddress;
    @property (nonatomic, setter=setSpouseName:, getter=spouseName) NSString* spouseName;
    @property (nonatomic, setter=setPersonalNotes:, getter=personalNotes) NSString* personalNotes;
    @property (nonatomic, setter=setChildren:, getter=children) MSCollection* children;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphProfilePhoto* photo;
  - (MSGraphEmailAddress*) emailAddresses:(NSInteger)index;
- (NSString*) imAddresses:(NSInteger)index;
- (NSString*) homePhones:(NSInteger)index;
- (NSString*) businessPhones:(NSInteger)index;
- (NSString*) children:(NSInteger)index;

@end
