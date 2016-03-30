// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphRecipient, MSGraphPost; 
#import "MSGraphRecipientCollection.h"
#import "MSCollection.h"
#import "MSGraphPostCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphConversationThread : MSGraphEntity

  @property (nonatomic, setter=setToRecipients:, getter=toRecipients) MSGraphRecipientCollection* toRecipients;
    @property (nonatomic, setter=setTopic:, getter=topic) NSString* topic;
    @property (nonatomic, setter=setHasAttachments:, getter=hasAttachments) BOOL hasAttachments;
    @property (nonatomic, setter=setLastDeliveredDateTime:, getter=lastDeliveredDateTime) NSDate* lastDeliveredDateTime;
    @property (nonatomic, setter=setUniqueSenders:, getter=uniqueSenders) MSCollection* uniqueSenders;
    @property (nonatomic, setter=setCcRecipients:, getter=ccRecipients) MSGraphRecipientCollection* ccRecipients;
    @property (nonatomic, setter=setPreview:, getter=preview) NSString* preview;
    @property (nonatomic, setter=setIsLocked:, getter=isLocked) BOOL isLocked;
    @property (nonatomic, setter=setPosts:, getter=posts) MSGraphPostCollection* posts;
  - (MSGraphRecipient*) toRecipients:(NSInteger)index;
- (NSString*) uniqueSenders:(NSInteger)index;
- (MSGraphRecipient*) ccRecipients:(NSInteger)index;
- (MSGraphPost*) posts:(NSInteger)index;

@end
