// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphPost()
{
    MSGraphItemBody* _body;
    NSDate* _receivedDateTime;
    BOOL _hasAttachments;
    MSGraphRecipient* _from;
    MSGraphRecipient* _sender;
    NSString* _conversationThreadId;
    MSGraphRecipientCollection* _newParticipants;
    NSString* _conversationId;
    MSGraphPost* _inReplyTo;
    MSGraphAttachmentCollection* _attachments;
}
@end

@implementation MSGraphPost

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.post";
    }
    return self;
}
- (MSGraphItemBody*) body
{
    if(!_body){
        _body = [[MSGraphItemBody alloc] initWithDictionary: self.dictionary[@"body"] ];
    }
    return _body;
}
- (void) setBody: (MSGraphItemBody*) val
{
    _body = val;
    self.dictionary[@"body"] = val;
}
- (NSDate*) receivedDateTime
{
    if(!_receivedDateTime){
        _receivedDateTime = [NSDate ms_dateFromString: self.dictionary[@"receivedDateTime"]];
    }
    return _receivedDateTime;
}
- (void) setReceivedDateTime: (NSDate*) val
{
    _receivedDateTime = val;
    self.dictionary[@"receivedDateTime"] = val;
}
- (BOOL) hasAttachments
{
    _hasAttachments = [self.dictionary[@"hasAttachments"] boolValue];
    return _hasAttachments;
}
- (void) setHasAttachments: (BOOL) val
{
    _hasAttachments = val;
    self.dictionary[@"hasAttachments"] = @(val);
}
- (MSGraphRecipient*) from
{
    if(!_from){
        _from = [[MSGraphRecipient alloc] initWithDictionary: self.dictionary[@"from"] ];
    }
    return _from;
}
- (void) setFrom: (MSGraphRecipient*) val
{
    _from = val;
    self.dictionary[@"from"] = val;
}
- (MSGraphRecipient*) sender
{
    if(!_sender){
        _sender = [[MSGraphRecipient alloc] initWithDictionary: self.dictionary[@"sender"] ];
    }
    return _sender;
}
- (void) setSender: (MSGraphRecipient*) val
{
    _sender = val;
    self.dictionary[@"sender"] = val;
}
- (NSString*) conversationThreadId
{
    return self.dictionary[@"conversationThreadId"];
}
- (void) setConversationThreadId: (NSString*) val
{
    self.dictionary[@"conversationThreadId"] = val;
}
- (MSGraphRecipientCollection*) getNewParticipants
{
    if(!_newParticipants){
        
    NSMutableArray *newParticipantsCollection = [NSMutableArray array];
    NSArray *newParticipantss = self.dictionary[@"newParticipants"];

    if ([newParticipantss isKindOfClass:[NSArray class]]){
        for (id newParticipants in newParticipantss){
            [newParticipantsCollection addObject:newParticipants];
         }
    }

    if ([newParticipantsCollection count] > 0){
        _newParticipants = [[MSGraphRecipientCollection alloc] initWithArray:newParticipantsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _newParticipants;
}
- (void) setNewParticipants: (MSGraphRecipientCollection*) val
{
    _newParticipants = val;
    self.dictionary[@"newParticipants"] = val;
}
- (NSString*) conversationId
{
    return self.dictionary[@"conversationId"];
}
- (void) setConversationId: (NSString*) val
{
    self.dictionary[@"conversationId"] = val;
}
- (MSGraphPost*) inReplyTo
{
    if(!_inReplyTo){
        _inReplyTo = [[MSGraphPost alloc] initWithDictionary: self.dictionary[@"inReplyTo"] ];
    }
    return _inReplyTo;
}
- (void) setInReplyTo: (MSGraphPost*) val
{
    _inReplyTo = val;
    self.dictionary[@"inReplyTo"] = val;
}
- (MSGraphAttachmentCollection*) attachments
{
    if(!_attachments){
        
    NSMutableArray *attachmentsCollection = [NSMutableArray array];
    NSArray *attachmentss = self.dictionary[@"attachments"];

    if ([attachmentss isKindOfClass:[NSArray class]]){
        for (id attachments in attachmentss){
            [attachmentsCollection addObject:attachments];
         }
    }

    if ([attachmentsCollection count] > 0){
        _attachments = [[MSGraphAttachmentCollection alloc] initWithArray:attachmentsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _attachments;
}
- (void) setAttachments: (MSGraphAttachmentCollection*) val
{
    _attachments = val;
    self.dictionary[@"attachments"] = val;
}
- (MSGraphRecipient*) newParticipants:(NSInteger)index
{
   MSGraphRecipient* newParticipants = nil;
   if (self.newParticipants.value){
       newParticipants = self.newParticipants.value[index];
   }
   return newParticipants;
}
- (MSGraphAttachment*) attachments:(NSInteger)index
{
   MSGraphAttachment* attachments = nil;
   if (self.attachments.value){
       attachments = self.attachments.value[index];
   }
   return attachments;
}

@end
