// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphUser()
{
    BOOL _accountEnabled;
    MSGraphAssignedLicenseCollection* _assignedLicenses;
    MSGraphAssignedPlanCollection* _assignedPlans;
    MSCollection* _businessPhones;
    NSString* _city;
    NSString* _companyName;
    NSString* _country;
    NSString* _department;
    NSString* _displayName;
    NSString* _givenName;
    NSString* _jobTitle;
    NSString* _mail;
    NSString* _mailNickname;
    NSString* _mobilePhone;
    NSString* _onPremisesImmutableId;
    NSDate* _onPremisesLastSyncDateTime;
    NSString* _onPremisesSecurityIdentifier;
    BOOL _onPremisesSyncEnabled;
    NSString* _passwordPolicies;
    MSGraphPasswordProfile* _passwordProfile;
    NSString* _officeLocation;
    NSString* _postalCode;
    NSString* _preferredLanguage;
    MSGraphProvisionedPlanCollection* _provisionedPlans;
    MSCollection* _proxyAddresses;
    NSString* _state;
    NSString* _streetAddress;
    NSString* _surname;
    NSString* _usageLocation;
    NSString* _userPrincipalName;
    NSString* _userType;
    NSString* _aboutMe;
    NSDate* _birthday;
    NSDate* _hireDate;
    MSCollection* _interests;
    NSString* _mySite;
    MSCollection* _pastProjects;
    NSString* _preferredName;
    MSCollection* _responsibilities;
    MSCollection* _schools;
    MSCollection* _skills;
    MSGraphDirectoryObjectCollection* _ownedDevices;
    MSGraphDirectoryObjectCollection* _registeredDevices;
    MSGraphDirectoryObject* _manager;
    MSGraphDirectoryObjectCollection* _directReports;
    MSGraphDirectoryObjectCollection* _memberOf;
    MSGraphDirectoryObjectCollection* _createdObjects;
    MSGraphDirectoryObjectCollection* _ownedObjects;
    MSGraphMessageCollection* _messages;
    MSGraphMailFolderCollection* _mailFolders;
    MSGraphCalendar* _calendar;
    MSGraphCalendarCollection* _calendars;
    MSGraphCalendarGroupCollection* _calendarGroups;
    MSGraphEventCollection* _calendarView;
    MSGraphEventCollection* _events;
    MSGraphContactCollection* _contacts;
    MSGraphContactFolderCollection* _contactFolders;
    MSGraphProfilePhoto* _photo;
    MSGraphDrive* _drive;
}
@end

@implementation MSGraphUser

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.user";
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
- (MSGraphAssignedLicenseCollection*) assignedLicenses
{
    if(!_assignedLicenses){
        
    NSMutableArray *assignedLicensesCollection = [NSMutableArray array];
    NSArray *assignedLicensess = self.dictionary[@"assignedLicenses"];

    if ([assignedLicensess isKindOfClass:[NSArray class]]){
        for (id assignedLicenses in assignedLicensess){
            [assignedLicensesCollection addObject:assignedLicenses];
         }
    }

    if ([assignedLicensesCollection count] > 0){
        _assignedLicenses = [[MSGraphAssignedLicenseCollection alloc] initWithArray:assignedLicensesCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _assignedLicenses;
}
- (void) setAssignedLicenses: (MSGraphAssignedLicenseCollection*) val
{
    _assignedLicenses = val;
    self.dictionary[@"assignedLicenses"] = val;
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
- (NSString*) companyName
{
    return self.dictionary[@"companyName"];
}
- (void) setCompanyName: (NSString*) val
{
    self.dictionary[@"companyName"] = val;
}
- (NSString*) country
{
    return self.dictionary[@"country"];
}
- (void) setCountry: (NSString*) val
{
    self.dictionary[@"country"] = val;
}
- (NSString*) department
{
    return self.dictionary[@"department"];
}
- (void) setDepartment: (NSString*) val
{
    self.dictionary[@"department"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSString*) givenName
{
    return self.dictionary[@"givenName"];
}
- (void) setGivenName: (NSString*) val
{
    self.dictionary[@"givenName"] = val;
}
- (NSString*) jobTitle
{
    return self.dictionary[@"jobTitle"];
}
- (void) setJobTitle: (NSString*) val
{
    self.dictionary[@"jobTitle"] = val;
}
- (NSString*) mail
{
    return self.dictionary[@"mail"];
}
- (void) setMail: (NSString*) val
{
    self.dictionary[@"mail"] = val;
}
- (NSString*) mailNickname
{
    return self.dictionary[@"mailNickname"];
}
- (void) setMailNickname: (NSString*) val
{
    self.dictionary[@"mailNickname"] = val;
}
- (NSString*) mobilePhone
{
    return self.dictionary[@"mobilePhone"];
}
- (void) setMobilePhone: (NSString*) val
{
    self.dictionary[@"mobilePhone"] = val;
}
- (NSString*) onPremisesImmutableId
{
    return self.dictionary[@"onPremisesImmutableId"];
}
- (void) setOnPremisesImmutableId: (NSString*) val
{
    self.dictionary[@"onPremisesImmutableId"] = val;
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
- (NSString*) onPremisesSecurityIdentifier
{
    return self.dictionary[@"onPremisesSecurityIdentifier"];
}
- (void) setOnPremisesSecurityIdentifier: (NSString*) val
{
    self.dictionary[@"onPremisesSecurityIdentifier"] = val;
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
- (NSString*) passwordPolicies
{
    return self.dictionary[@"passwordPolicies"];
}
- (void) setPasswordPolicies: (NSString*) val
{
    self.dictionary[@"passwordPolicies"] = val;
}
- (MSGraphPasswordProfile*) passwordProfile
{
    if(!_passwordProfile){
        _passwordProfile = [[MSGraphPasswordProfile alloc] initWithDictionary: self.dictionary[@"passwordProfile"] ];
    }
    return _passwordProfile;
}
- (void) setPasswordProfile: (MSGraphPasswordProfile*) val
{
    _passwordProfile = val;
    self.dictionary[@"passwordProfile"] = val;
}
- (NSString*) officeLocation
{
    return self.dictionary[@"officeLocation"];
}
- (void) setOfficeLocation: (NSString*) val
{
    self.dictionary[@"officeLocation"] = val;
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
- (MSCollection*) proxyAddresses
{
    return self.dictionary[@"proxyAddresses"];
}
- (void) setProxyAddresses: (MSCollection*) val
{
    self.dictionary[@"proxyAddresses"] = val;
}
- (NSString*) state
{
    return self.dictionary[@"state"];
}
- (void) setState: (NSString*) val
{
    self.dictionary[@"state"] = val;
}
- (NSString*) streetAddress
{
    return self.dictionary[@"streetAddress"];
}
- (void) setStreetAddress: (NSString*) val
{
    self.dictionary[@"streetAddress"] = val;
}
- (NSString*) surname
{
    return self.dictionary[@"surname"];
}
- (void) setSurname: (NSString*) val
{
    self.dictionary[@"surname"] = val;
}
- (NSString*) usageLocation
{
    return self.dictionary[@"usageLocation"];
}
- (void) setUsageLocation: (NSString*) val
{
    self.dictionary[@"usageLocation"] = val;
}
- (NSString*) userPrincipalName
{
    return self.dictionary[@"userPrincipalName"];
}
- (void) setUserPrincipalName: (NSString*) val
{
    self.dictionary[@"userPrincipalName"] = val;
}
- (NSString*) userType
{
    return self.dictionary[@"userType"];
}
- (void) setUserType: (NSString*) val
{
    self.dictionary[@"userType"] = val;
}
- (NSString*) aboutMe
{
    return self.dictionary[@"aboutMe"];
}
- (void) setAboutMe: (NSString*) val
{
    self.dictionary[@"aboutMe"] = val;
}
- (NSDate*) birthday
{
    if(!_birthday){
        _birthday = [NSDate ms_dateFromString: self.dictionary[@"birthday"]];
    }
    return _birthday;
}
- (void) setBirthday: (NSDate*) val
{
    _birthday = val;
    self.dictionary[@"birthday"] = val;
}
- (NSDate*) hireDate
{
    if(!_hireDate){
        _hireDate = [NSDate ms_dateFromString: self.dictionary[@"hireDate"]];
    }
    return _hireDate;
}
- (void) setHireDate: (NSDate*) val
{
    _hireDate = val;
    self.dictionary[@"hireDate"] = val;
}
- (MSCollection*) interests
{
    return self.dictionary[@"interests"];
}
- (void) setInterests: (MSCollection*) val
{
    self.dictionary[@"interests"] = val;
}
- (NSString*) mySite
{
    return self.dictionary[@"mySite"];
}
- (void) setMySite: (NSString*) val
{
    self.dictionary[@"mySite"] = val;
}
- (MSCollection*) pastProjects
{
    return self.dictionary[@"pastProjects"];
}
- (void) setPastProjects: (MSCollection*) val
{
    self.dictionary[@"pastProjects"] = val;
}
- (NSString*) preferredName
{
    return self.dictionary[@"preferredName"];
}
- (void) setPreferredName: (NSString*) val
{
    self.dictionary[@"preferredName"] = val;
}
- (MSCollection*) responsibilities
{
    return self.dictionary[@"responsibilities"];
}
- (void) setResponsibilities: (MSCollection*) val
{
    self.dictionary[@"responsibilities"] = val;
}
- (MSCollection*) schools
{
    return self.dictionary[@"schools"];
}
- (void) setSchools: (MSCollection*) val
{
    self.dictionary[@"schools"] = val;
}
- (MSCollection*) skills
{
    return self.dictionary[@"skills"];
}
- (void) setSkills: (MSCollection*) val
{
    self.dictionary[@"skills"] = val;
}
- (MSGraphDirectoryObjectCollection*) ownedDevices
{
    if(!_ownedDevices){
        
    NSMutableArray *ownedDevicesCollection = [NSMutableArray array];
    NSArray *ownedDevicess = self.dictionary[@"ownedDevices"];

    if ([ownedDevicess isKindOfClass:[NSArray class]]){
        for (id ownedDevices in ownedDevicess){
            [ownedDevicesCollection addObject:ownedDevices];
         }
    }

    if ([ownedDevicesCollection count] > 0){
        _ownedDevices = [[MSGraphDirectoryObjectCollection alloc] initWithArray:ownedDevicesCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _ownedDevices;
}
- (void) setOwnedDevices: (MSGraphDirectoryObjectCollection*) val
{
    _ownedDevices = val;
    self.dictionary[@"ownedDevices"] = val;
}
- (MSGraphDirectoryObjectCollection*) registeredDevices
{
    if(!_registeredDevices){
        
    NSMutableArray *registeredDevicesCollection = [NSMutableArray array];
    NSArray *registeredDevicess = self.dictionary[@"registeredDevices"];

    if ([registeredDevicess isKindOfClass:[NSArray class]]){
        for (id registeredDevices in registeredDevicess){
            [registeredDevicesCollection addObject:registeredDevices];
         }
    }

    if ([registeredDevicesCollection count] > 0){
        _registeredDevices = [[MSGraphDirectoryObjectCollection alloc] initWithArray:registeredDevicesCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _registeredDevices;
}
- (void) setRegisteredDevices: (MSGraphDirectoryObjectCollection*) val
{
    _registeredDevices = val;
    self.dictionary[@"registeredDevices"] = val;
}
- (MSGraphDirectoryObject*) manager
{
    if(!_manager){
        _manager = [[MSGraphDirectoryObject alloc] initWithDictionary: self.dictionary[@"manager"] ];
    }
    return _manager;
}
- (void) setManager: (MSGraphDirectoryObject*) val
{
    _manager = val;
    self.dictionary[@"manager"] = val;
}
- (MSGraphDirectoryObjectCollection*) directReports
{
    if(!_directReports){
        
    NSMutableArray *directReportsCollection = [NSMutableArray array];
    NSArray *directReportss = self.dictionary[@"directReports"];

    if ([directReportss isKindOfClass:[NSArray class]]){
        for (id directReports in directReportss){
            [directReportsCollection addObject:directReports];
         }
    }

    if ([directReportsCollection count] > 0){
        _directReports = [[MSGraphDirectoryObjectCollection alloc] initWithArray:directReportsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _directReports;
}
- (void) setDirectReports: (MSGraphDirectoryObjectCollection*) val
{
    _directReports = val;
    self.dictionary[@"directReports"] = val;
}
- (MSGraphDirectoryObjectCollection*) memberOf
{
    if(!_memberOf){
        
    NSMutableArray *memberOfCollection = [NSMutableArray array];
    NSArray *memberOfs = self.dictionary[@"memberOf"];

    if ([memberOfs isKindOfClass:[NSArray class]]){
        for (id memberOf in memberOfs){
            [memberOfCollection addObject:memberOf];
         }
    }

    if ([memberOfCollection count] > 0){
        _memberOf = [[MSGraphDirectoryObjectCollection alloc] initWithArray:memberOfCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _memberOf;
}
- (void) setMemberOf: (MSGraphDirectoryObjectCollection*) val
{
    _memberOf = val;
    self.dictionary[@"memberOf"] = val;
}
- (MSGraphDirectoryObjectCollection*) createdObjects
{
    if(!_createdObjects){
        
    NSMutableArray *createdObjectsCollection = [NSMutableArray array];
    NSArray *createdObjectss = self.dictionary[@"createdObjects"];

    if ([createdObjectss isKindOfClass:[NSArray class]]){
        for (id createdObjects in createdObjectss){
            [createdObjectsCollection addObject:createdObjects];
         }
    }

    if ([createdObjectsCollection count] > 0){
        _createdObjects = [[MSGraphDirectoryObjectCollection alloc] initWithArray:createdObjectsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _createdObjects;
}
- (void) setCreatedObjects: (MSGraphDirectoryObjectCollection*) val
{
    _createdObjects = val;
    self.dictionary[@"createdObjects"] = val;
}
- (MSGraphDirectoryObjectCollection*) ownedObjects
{
    if(!_ownedObjects){
        
    NSMutableArray *ownedObjectsCollection = [NSMutableArray array];
    NSArray *ownedObjectss = self.dictionary[@"ownedObjects"];

    if ([ownedObjectss isKindOfClass:[NSArray class]]){
        for (id ownedObjects in ownedObjectss){
            [ownedObjectsCollection addObject:ownedObjects];
         }
    }

    if ([ownedObjectsCollection count] > 0){
        _ownedObjects = [[MSGraphDirectoryObjectCollection alloc] initWithArray:ownedObjectsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _ownedObjects;
}
- (void) setOwnedObjects: (MSGraphDirectoryObjectCollection*) val
{
    _ownedObjects = val;
    self.dictionary[@"ownedObjects"] = val;
}
- (MSGraphMessageCollection*) messages
{
    if(!_messages){
        
    NSMutableArray *messagesCollection = [NSMutableArray array];
    NSArray *messagess = self.dictionary[@"messages"];

    if ([messagess isKindOfClass:[NSArray class]]){
        for (id messages in messagess){
            [messagesCollection addObject:messages];
         }
    }

    if ([messagesCollection count] > 0){
        _messages = [[MSGraphMessageCollection alloc] initWithArray:messagesCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _messages;
}
- (void) setMessages: (MSGraphMessageCollection*) val
{
    _messages = val;
    self.dictionary[@"messages"] = val;
}
- (MSGraphMailFolderCollection*) mailFolders
{
    if(!_mailFolders){
        
    NSMutableArray *mailFoldersCollection = [NSMutableArray array];
    NSArray *mailFolderss = self.dictionary[@"mailFolders"];

    if ([mailFolderss isKindOfClass:[NSArray class]]){
        for (id mailFolders in mailFolderss){
            [mailFoldersCollection addObject:mailFolders];
         }
    }

    if ([mailFoldersCollection count] > 0){
        _mailFolders = [[MSGraphMailFolderCollection alloc] initWithArray:mailFoldersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _mailFolders;
}
- (void) setMailFolders: (MSGraphMailFolderCollection*) val
{
    _mailFolders = val;
    self.dictionary[@"mailFolders"] = val;
}
- (MSGraphCalendar*) calendar
{
    if(!_calendar){
        _calendar = [[MSGraphCalendar alloc] initWithDictionary: self.dictionary[@"calendar"] ];
    }
    return _calendar;
}
- (void) setCalendar: (MSGraphCalendar*) val
{
    _calendar = val;
    self.dictionary[@"calendar"] = val;
}
- (MSGraphCalendarCollection*) calendars
{
    if(!_calendars){
        
    NSMutableArray *calendarsCollection = [NSMutableArray array];
    NSArray *calendarss = self.dictionary[@"calendars"];

    if ([calendarss isKindOfClass:[NSArray class]]){
        for (id calendars in calendarss){
            [calendarsCollection addObject:calendars];
         }
    }

    if ([calendarsCollection count] > 0){
        _calendars = [[MSGraphCalendarCollection alloc] initWithArray:calendarsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _calendars;
}
- (void) setCalendars: (MSGraphCalendarCollection*) val
{
    _calendars = val;
    self.dictionary[@"calendars"] = val;
}
- (MSGraphCalendarGroupCollection*) calendarGroups
{
    if(!_calendarGroups){
        
    NSMutableArray *calendarGroupsCollection = [NSMutableArray array];
    NSArray *calendarGroupss = self.dictionary[@"calendarGroups"];

    if ([calendarGroupss isKindOfClass:[NSArray class]]){
        for (id calendarGroups in calendarGroupss){
            [calendarGroupsCollection addObject:calendarGroups];
         }
    }

    if ([calendarGroupsCollection count] > 0){
        _calendarGroups = [[MSGraphCalendarGroupCollection alloc] initWithArray:calendarGroupsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _calendarGroups;
}
- (void) setCalendarGroups: (MSGraphCalendarGroupCollection*) val
{
    _calendarGroups = val;
    self.dictionary[@"calendarGroups"] = val;
}
- (MSGraphEventCollection*) calendarView
{
    if(!_calendarView){
        
    NSMutableArray *calendarViewCollection = [NSMutableArray array];
    NSArray *calendarViews = self.dictionary[@"calendarView"];

    if ([calendarViews isKindOfClass:[NSArray class]]){
        for (id calendarView in calendarViews){
            [calendarViewCollection addObject:calendarView];
         }
    }

    if ([calendarViewCollection count] > 0){
        _calendarView = [[MSGraphEventCollection alloc] initWithArray:calendarViewCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _calendarView;
}
- (void) setCalendarView: (MSGraphEventCollection*) val
{
    _calendarView = val;
    self.dictionary[@"calendarView"] = val;
}
- (MSGraphEventCollection*) events
{
    if(!_events){
        
    NSMutableArray *eventsCollection = [NSMutableArray array];
    NSArray *eventss = self.dictionary[@"events"];

    if ([eventss isKindOfClass:[NSArray class]]){
        for (id events in eventss){
            [eventsCollection addObject:events];
         }
    }

    if ([eventsCollection count] > 0){
        _events = [[MSGraphEventCollection alloc] initWithArray:eventsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _events;
}
- (void) setEvents: (MSGraphEventCollection*) val
{
    _events = val;
    self.dictionary[@"events"] = val;
}
- (MSGraphContactCollection*) contacts
{
    if(!_contacts){
        
    NSMutableArray *contactsCollection = [NSMutableArray array];
    NSArray *contactss = self.dictionary[@"contacts"];

    if ([contactss isKindOfClass:[NSArray class]]){
        for (id contacts in contactss){
            [contactsCollection addObject:contacts];
         }
    }

    if ([contactsCollection count] > 0){
        _contacts = [[MSGraphContactCollection alloc] initWithArray:contactsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _contacts;
}
- (void) setContacts: (MSGraphContactCollection*) val
{
    _contacts = val;
    self.dictionary[@"contacts"] = val;
}
- (MSGraphContactFolderCollection*) contactFolders
{
    if(!_contactFolders){
        
    NSMutableArray *contactFoldersCollection = [NSMutableArray array];
    NSArray *contactFolderss = self.dictionary[@"contactFolders"];

    if ([contactFolderss isKindOfClass:[NSArray class]]){
        for (id contactFolders in contactFolderss){
            [contactFoldersCollection addObject:contactFolders];
         }
    }

    if ([contactFoldersCollection count] > 0){
        _contactFolders = [[MSGraphContactFolderCollection alloc] initWithArray:contactFoldersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _contactFolders;
}
- (void) setContactFolders: (MSGraphContactFolderCollection*) val
{
    _contactFolders = val;
    self.dictionary[@"contactFolders"] = val;
}
- (MSGraphProfilePhoto*) photo
{
    if(!_photo){
        _photo = [[MSGraphProfilePhoto alloc] initWithDictionary: self.dictionary[@"photo"] ];
    }
    return _photo;
}
- (void) setPhoto: (MSGraphProfilePhoto*) val
{
    _photo = val;
    self.dictionary[@"photo"] = val;
}
- (MSGraphDrive*) drive
{
    if(!_drive){
        _drive = [[MSGraphDrive alloc] initWithDictionary: self.dictionary[@"drive"] ];
    }
    return _drive;
}
- (void) setDrive: (MSGraphDrive*) val
{
    _drive = val;
    self.dictionary[@"drive"] = val;
}
- (MSGraphAssignedLicense*) assignedLicenses:(NSInteger)index
{
   MSGraphAssignedLicense* assignedLicenses = nil;
   if (self.assignedLicenses.value){
       assignedLicenses = self.assignedLicenses.value[index];
   }
   return assignedLicenses;
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
- (MSGraphProvisionedPlan*) provisionedPlans:(NSInteger)index
{
   MSGraphProvisionedPlan* provisionedPlans = nil;
   if (self.provisionedPlans.value){
       provisionedPlans = self.provisionedPlans.value[index];
   }
   return provisionedPlans;
}
- (NSString*) proxyAddresses:(NSInteger)index
{
   NSString* proxyAddresses = nil;
   if (self.proxyAddresses.value){
       proxyAddresses = self.proxyAddresses.value[index];
   }
   return proxyAddresses;
}
- (NSString*) interests:(NSInteger)index
{
   NSString* interests = nil;
   if (self.interests.value){
       interests = self.interests.value[index];
   }
   return interests;
}
- (NSString*) pastProjects:(NSInteger)index
{
   NSString* pastProjects = nil;
   if (self.pastProjects.value){
       pastProjects = self.pastProjects.value[index];
   }
   return pastProjects;
}
- (NSString*) responsibilities:(NSInteger)index
{
   NSString* responsibilities = nil;
   if (self.responsibilities.value){
       responsibilities = self.responsibilities.value[index];
   }
   return responsibilities;
}
- (NSString*) schools:(NSInteger)index
{
   NSString* schools = nil;
   if (self.schools.value){
       schools = self.schools.value[index];
   }
   return schools;
}
- (NSString*) skills:(NSInteger)index
{
   NSString* skills = nil;
   if (self.skills.value){
       skills = self.skills.value[index];
   }
   return skills;
}
- (MSGraphDirectoryObject*) ownedDevices:(NSInteger)index
{
   MSGraphDirectoryObject* ownedDevices = nil;
   if (self.ownedDevices.value){
       ownedDevices = self.ownedDevices.value[index];
   }
   return ownedDevices;
}
- (MSGraphDirectoryObject*) registeredDevices:(NSInteger)index
{
   MSGraphDirectoryObject* registeredDevices = nil;
   if (self.registeredDevices.value){
       registeredDevices = self.registeredDevices.value[index];
   }
   return registeredDevices;
}
- (MSGraphDirectoryObject*) directReports:(NSInteger)index
{
   MSGraphDirectoryObject* directReports = nil;
   if (self.directReports.value){
       directReports = self.directReports.value[index];
   }
   return directReports;
}
- (MSGraphDirectoryObject*) memberOf:(NSInteger)index
{
   MSGraphDirectoryObject* memberOf = nil;
   if (self.memberOf.value){
       memberOf = self.memberOf.value[index];
   }
   return memberOf;
}
- (MSGraphDirectoryObject*) createdObjects:(NSInteger)index
{
   MSGraphDirectoryObject* createdObjects = nil;
   if (self.createdObjects.value){
       createdObjects = self.createdObjects.value[index];
   }
   return createdObjects;
}
- (MSGraphDirectoryObject*) ownedObjects:(NSInteger)index
{
   MSGraphDirectoryObject* ownedObjects = nil;
   if (self.ownedObjects.value){
       ownedObjects = self.ownedObjects.value[index];
   }
   return ownedObjects;
}
- (MSGraphMessage*) messages:(NSInteger)index
{
   MSGraphMessage* messages = nil;
   if (self.messages.value){
       messages = self.messages.value[index];
   }
   return messages;
}
- (MSGraphMailFolder*) mailFolders:(NSInteger)index
{
   MSGraphMailFolder* mailFolders = nil;
   if (self.mailFolders.value){
       mailFolders = self.mailFolders.value[index];
   }
   return mailFolders;
}
- (MSGraphCalendar*) calendars:(NSInteger)index
{
   MSGraphCalendar* calendars = nil;
   if (self.calendars.value){
       calendars = self.calendars.value[index];
   }
   return calendars;
}
- (MSGraphCalendarGroup*) calendarGroups:(NSInteger)index
{
   MSGraphCalendarGroup* calendarGroups = nil;
   if (self.calendarGroups.value){
       calendarGroups = self.calendarGroups.value[index];
   }
   return calendarGroups;
}
- (MSGraphEvent*) calendarView:(NSInteger)index
{
   MSGraphEvent* calendarView = nil;
   if (self.calendarView.value){
       calendarView = self.calendarView.value[index];
   }
   return calendarView;
}
- (MSGraphEvent*) events:(NSInteger)index
{
   MSGraphEvent* events = nil;
   if (self.events.value){
       events = self.events.value[index];
   }
   return events;
}
- (MSGraphContact*) contacts:(NSInteger)index
{
   MSGraphContact* contacts = nil;
   if (self.contacts.value){
       contacts = self.contacts.value[index];
   }
   return contacts;
}
- (MSGraphContactFolder*) contactFolders:(NSInteger)index
{
   MSGraphContactFolder* contactFolders = nil;
   if (self.contactFolders.value){
       contactFolders = self.contactFolders.value[index];
   }
   return contactFolders;
}

@end
