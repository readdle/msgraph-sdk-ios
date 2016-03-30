// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphGroup()
{
    NSString* _groupDescription;
    NSString* _displayName;
    MSCollection* _groupTypes;
    NSString* _mail;
    BOOL _mailEnabled;
    NSString* _mailNickname;
    NSDate* _onPremisesLastSyncDateTime;
    NSString* _onPremisesSecurityIdentifier;
    BOOL _onPremisesSyncEnabled;
    MSCollection* _proxyAddresses;
    BOOL _securityEnabled;
    NSString* _visibility;
    BOOL _allowExternalSenders;
    BOOL _autoSubscribeNewMembers;
    BOOL _isSubscribedByMail;
    int32_t _unseenCount;
    MSGraphDirectoryObjectCollection* _members;
    MSGraphDirectoryObjectCollection* _memberOf;
    MSGraphDirectoryObject* _createdOnBehalfOf;
    MSGraphDirectoryObjectCollection* _owners;
    MSGraphConversationThreadCollection* _threads;
    MSGraphCalendar* _calendar;
    MSGraphEventCollection* _calendarView;
    MSGraphEventCollection* _events;
    MSGraphConversationCollection* _conversations;
    MSGraphProfilePhoto* _photo;
    MSGraphDirectoryObjectCollection* _acceptedSenders;
    MSGraphDirectoryObjectCollection* _rejectedSenders;
    MSGraphDrive* _drive;
}
@end

@implementation MSGraphGroup

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.group";
    }
    return self;
}
- (NSString*) groupDescription
{
    return self.dictionary[@"description"];
}
- (void) setGroupDescription: (NSString*) val
{
    self.dictionary[@"description"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (MSCollection*) groupTypes
{
    return self.dictionary[@"groupTypes"];
}
- (void) setGroupTypes: (MSCollection*) val
{
    self.dictionary[@"groupTypes"] = val;
}
- (NSString*) mail
{
    return self.dictionary[@"mail"];
}
- (void) setMail: (NSString*) val
{
    self.dictionary[@"mail"] = val;
}
- (BOOL) mailEnabled
{
    _mailEnabled = [self.dictionary[@"mailEnabled"] boolValue];
    return _mailEnabled;
}
- (void) setMailEnabled: (BOOL) val
{
    _mailEnabled = val;
    self.dictionary[@"mailEnabled"] = @(val);
}
- (NSString*) mailNickname
{
    return self.dictionary[@"mailNickname"];
}
- (void) setMailNickname: (NSString*) val
{
    self.dictionary[@"mailNickname"] = val;
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
- (MSCollection*) proxyAddresses
{
    return self.dictionary[@"proxyAddresses"];
}
- (void) setProxyAddresses: (MSCollection*) val
{
    self.dictionary[@"proxyAddresses"] = val;
}
- (BOOL) securityEnabled
{
    _securityEnabled = [self.dictionary[@"securityEnabled"] boolValue];
    return _securityEnabled;
}
- (void) setSecurityEnabled: (BOOL) val
{
    _securityEnabled = val;
    self.dictionary[@"securityEnabled"] = @(val);
}
- (NSString*) visibility
{
    return self.dictionary[@"visibility"];
}
- (void) setVisibility: (NSString*) val
{
    self.dictionary[@"visibility"] = val;
}
- (BOOL) allowExternalSenders
{
    _allowExternalSenders = [self.dictionary[@"allowExternalSenders"] boolValue];
    return _allowExternalSenders;
}
- (void) setAllowExternalSenders: (BOOL) val
{
    _allowExternalSenders = val;
    self.dictionary[@"allowExternalSenders"] = @(val);
}
- (BOOL) autoSubscribeNewMembers
{
    _autoSubscribeNewMembers = [self.dictionary[@"autoSubscribeNewMembers"] boolValue];
    return _autoSubscribeNewMembers;
}
- (void) setAutoSubscribeNewMembers: (BOOL) val
{
    _autoSubscribeNewMembers = val;
    self.dictionary[@"autoSubscribeNewMembers"] = @(val);
}
- (BOOL) isSubscribedByMail
{
    _isSubscribedByMail = [self.dictionary[@"isSubscribedByMail"] boolValue];
    return _isSubscribedByMail;
}
- (void) setIsSubscribedByMail: (BOOL) val
{
    _isSubscribedByMail = val;
    self.dictionary[@"isSubscribedByMail"] = @(val);
}
- (int32_t) unseenCount
{
    _unseenCount = [self.dictionary[@"unseenCount"] intValue];
    return _unseenCount;
}
- (void) setUnseenCount: (int32_t) val
{
    _unseenCount = val;
    self.dictionary[@"unseenCount"] = @(val);
}
- (MSGraphDirectoryObjectCollection*) members
{
    if(!_members){
        
    NSMutableArray *membersCollection = [NSMutableArray array];
    NSArray *memberss = self.dictionary[@"members"];

    if ([memberss isKindOfClass:[NSArray class]]){
        for (id members in memberss){
            [membersCollection addObject:members];
         }
    }

    if ([membersCollection count] > 0){
        _members = [[MSGraphDirectoryObjectCollection alloc] initWithArray:membersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _members;
}
- (void) setMembers: (MSGraphDirectoryObjectCollection*) val
{
    _members = val;
    self.dictionary[@"members"] = val;
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
- (MSGraphDirectoryObject*) createdOnBehalfOf
{
    if(!_createdOnBehalfOf){
        _createdOnBehalfOf = [[MSGraphDirectoryObject alloc] initWithDictionary: self.dictionary[@"createdOnBehalfOf"] ];
    }
    return _createdOnBehalfOf;
}
- (void) setCreatedOnBehalfOf: (MSGraphDirectoryObject*) val
{
    _createdOnBehalfOf = val;
    self.dictionary[@"createdOnBehalfOf"] = val;
}
- (MSGraphDirectoryObjectCollection*) owners
{
    if(!_owners){
        
    NSMutableArray *ownersCollection = [NSMutableArray array];
    NSArray *ownerss = self.dictionary[@"owners"];

    if ([ownerss isKindOfClass:[NSArray class]]){
        for (id owners in ownerss){
            [ownersCollection addObject:owners];
         }
    }

    if ([ownersCollection count] > 0){
        _owners = [[MSGraphDirectoryObjectCollection alloc] initWithArray:ownersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _owners;
}
- (void) setOwners: (MSGraphDirectoryObjectCollection*) val
{
    _owners = val;
    self.dictionary[@"owners"] = val;
}
- (MSGraphConversationThreadCollection*) threads
{
    if(!_threads){
        
    NSMutableArray *threadsCollection = [NSMutableArray array];
    NSArray *threadss = self.dictionary[@"threads"];

    if ([threadss isKindOfClass:[NSArray class]]){
        for (id threads in threadss){
            [threadsCollection addObject:threads];
         }
    }

    if ([threadsCollection count] > 0){
        _threads = [[MSGraphConversationThreadCollection alloc] initWithArray:threadsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _threads;
}
- (void) setThreads: (MSGraphConversationThreadCollection*) val
{
    _threads = val;
    self.dictionary[@"threads"] = val;
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
- (MSGraphConversationCollection*) conversations
{
    if(!_conversations){
        
    NSMutableArray *conversationsCollection = [NSMutableArray array];
    NSArray *conversationss = self.dictionary[@"conversations"];

    if ([conversationss isKindOfClass:[NSArray class]]){
        for (id conversations in conversationss){
            [conversationsCollection addObject:conversations];
         }
    }

    if ([conversationsCollection count] > 0){
        _conversations = [[MSGraphConversationCollection alloc] initWithArray:conversationsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _conversations;
}
- (void) setConversations: (MSGraphConversationCollection*) val
{
    _conversations = val;
    self.dictionary[@"conversations"] = val;
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
- (MSGraphDirectoryObjectCollection*) acceptedSenders
{
    if(!_acceptedSenders){
        
    NSMutableArray *acceptedSendersCollection = [NSMutableArray array];
    NSArray *acceptedSenderss = self.dictionary[@"acceptedSenders"];

    if ([acceptedSenderss isKindOfClass:[NSArray class]]){
        for (id acceptedSenders in acceptedSenderss){
            [acceptedSendersCollection addObject:acceptedSenders];
         }
    }

    if ([acceptedSendersCollection count] > 0){
        _acceptedSenders = [[MSGraphDirectoryObjectCollection alloc] initWithArray:acceptedSendersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _acceptedSenders;
}
- (void) setAcceptedSenders: (MSGraphDirectoryObjectCollection*) val
{
    _acceptedSenders = val;
    self.dictionary[@"acceptedSenders"] = val;
}
- (MSGraphDirectoryObjectCollection*) rejectedSenders
{
    if(!_rejectedSenders){
        
    NSMutableArray *rejectedSendersCollection = [NSMutableArray array];
    NSArray *rejectedSenderss = self.dictionary[@"rejectedSenders"];

    if ([rejectedSenderss isKindOfClass:[NSArray class]]){
        for (id rejectedSenders in rejectedSenderss){
            [rejectedSendersCollection addObject:rejectedSenders];
         }
    }

    if ([rejectedSendersCollection count] > 0){
        _rejectedSenders = [[MSGraphDirectoryObjectCollection alloc] initWithArray:rejectedSendersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _rejectedSenders;
}
- (void) setRejectedSenders: (MSGraphDirectoryObjectCollection*) val
{
    _rejectedSenders = val;
    self.dictionary[@"rejectedSenders"] = val;
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
- (NSString*) groupTypes:(NSInteger)index
{
   NSString* groupTypes = nil;
   if (self.groupTypes.value){
       groupTypes = self.groupTypes.value[index];
   }
   return groupTypes;
}
- (NSString*) proxyAddresses:(NSInteger)index
{
   NSString* proxyAddresses = nil;
   if (self.proxyAddresses.value){
       proxyAddresses = self.proxyAddresses.value[index];
   }
   return proxyAddresses;
}
- (MSGraphDirectoryObject*) members:(NSInteger)index
{
   MSGraphDirectoryObject* members = nil;
   if (self.members.value){
       members = self.members.value[index];
   }
   return members;
}
- (MSGraphDirectoryObject*) memberOf:(NSInteger)index
{
   MSGraphDirectoryObject* memberOf = nil;
   if (self.memberOf.value){
       memberOf = self.memberOf.value[index];
   }
   return memberOf;
}
- (MSGraphDirectoryObject*) owners:(NSInteger)index
{
   MSGraphDirectoryObject* owners = nil;
   if (self.owners.value){
       owners = self.owners.value[index];
   }
   return owners;
}
- (MSGraphConversationThread*) threads:(NSInteger)index
{
   MSGraphConversationThread* threads = nil;
   if (self.threads.value){
       threads = self.threads.value[index];
   }
   return threads;
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
- (MSGraphConversation*) conversations:(NSInteger)index
{
   MSGraphConversation* conversations = nil;
   if (self.conversations.value){
       conversations = self.conversations.value[index];
   }
   return conversations;
}
- (MSGraphDirectoryObject*) acceptedSenders:(NSInteger)index
{
   MSGraphDirectoryObject* acceptedSenders = nil;
   if (self.acceptedSenders.value){
       acceptedSenders = self.acceptedSenders.value[index];
   }
   return acceptedSenders;
}
- (MSGraphDirectoryObject*) rejectedSenders:(NSInteger)index
{
   MSGraphDirectoryObject* rejectedSenders = nil;
   if (self.rejectedSenders.value){
       rejectedSenders = self.rejectedSenders.value[index];
   }
   return rejectedSenders;
}

@end
