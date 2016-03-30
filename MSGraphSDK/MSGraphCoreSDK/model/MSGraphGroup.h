// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryObject, MSGraphConversationThread, MSGraphCalendar, MSGraphEvent, MSGraphConversation, MSGraphProfilePhoto, MSGraphDrive; 
#import "MSCollection.h"
#import "MSGraphDirectoryObjectCollection.h"
#import "MSGraphConversationThreadCollection.h"
#import "MSGraphEventCollection.h"
#import "MSGraphConversationCollection.h"


#import "MSGraphDirectoryObject.h"
#import "MSCollection.h"

@interface MSGraphGroup : MSGraphDirectoryObject

  @property (nonatomic, setter=setGroupDescription:, getter=groupDescription) NSString* groupDescription;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setGroupTypes:, getter=groupTypes) MSCollection* groupTypes;
    @property (nonatomic, setter=setMail:, getter=mail) NSString* mail;
    @property (nonatomic, setter=setMailEnabled:, getter=mailEnabled) BOOL mailEnabled;
    @property (nonatomic, setter=setMailNickname:, getter=mailNickname) NSString* mailNickname;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSecurityIdentifier:, getter=onPremisesSecurityIdentifier) NSString* onPremisesSecurityIdentifier;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setProxyAddresses:, getter=proxyAddresses) MSCollection* proxyAddresses;
    @property (nonatomic, setter=setSecurityEnabled:, getter=securityEnabled) BOOL securityEnabled;
    @property (nonatomic, setter=setVisibility:, getter=visibility) NSString* visibility;
    @property (nonatomic, setter=setAllowExternalSenders:, getter=allowExternalSenders) BOOL allowExternalSenders;
    @property (nonatomic, setter=setAutoSubscribeNewMembers:, getter=autoSubscribeNewMembers) BOOL autoSubscribeNewMembers;
    @property (nonatomic, setter=setIsSubscribedByMail:, getter=isSubscribedByMail) BOOL isSubscribedByMail;
    @property (nonatomic, setter=setUnseenCount:, getter=unseenCount) int32_t unseenCount;
    @property (nonatomic, setter=setMembers:, getter=members) MSGraphDirectoryObjectCollection* members;
    @property (nonatomic, setter=setMemberOf:, getter=memberOf) MSGraphDirectoryObjectCollection* memberOf;
    @property (nonatomic, setter=setCreatedOnBehalfOf:, getter=createdOnBehalfOf) MSGraphDirectoryObject* createdOnBehalfOf;
    @property (nonatomic, setter=setOwners:, getter=owners) MSGraphDirectoryObjectCollection* owners;
    @property (nonatomic, setter=setThreads:, getter=threads) MSGraphConversationThreadCollection* threads;
    @property (nonatomic, setter=setCalendar:, getter=calendar) MSGraphCalendar* calendar;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) MSGraphEventCollection* calendarView;
    @property (nonatomic, setter=setEvents:, getter=events) MSGraphEventCollection* events;
    @property (nonatomic, setter=setConversations:, getter=conversations) MSGraphConversationCollection* conversations;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphProfilePhoto* photo;
    @property (nonatomic, setter=setAcceptedSenders:, getter=acceptedSenders) MSGraphDirectoryObjectCollection* acceptedSenders;
    @property (nonatomic, setter=setRejectedSenders:, getter=rejectedSenders) MSGraphDirectoryObjectCollection* rejectedSenders;
    @property (nonatomic, setter=setDrive:, getter=drive) MSGraphDrive* drive;
  - (NSString*) groupTypes:(NSInteger)index;
- (NSString*) proxyAddresses:(NSInteger)index;
- (MSGraphDirectoryObject*) members:(NSInteger)index;
- (MSGraphDirectoryObject*) memberOf:(NSInteger)index;
- (MSGraphDirectoryObject*) owners:(NSInteger)index;
- (MSGraphConversationThread*) threads:(NSInteger)index;
- (MSGraphEvent*) calendarView:(NSInteger)index;
- (MSGraphEvent*) events:(NSInteger)index;
- (MSGraphConversation*) conversations:(NSInteger)index;
- (MSGraphDirectoryObject*) acceptedSenders:(NSInteger)index;
- (MSGraphDirectoryObject*) rejectedSenders:(NSInteger)index;

@end
