// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphMessage()
{
    NSDate* _receivedDateTime;
    NSDate* _sentDateTime;
    BOOL _hasAttachments;
    NSString* _internetMessageId;
    NSString* _subject;
    MSGraphItemBody* _body;
    NSString* _bodyPreview;
    MSGraphImportance _importance;
    NSString* _parentFolderId;
    MSGraphRecipient* _sender;
    MSGraphRecipient* _from;
    MSGraphRecipientCollection* _toRecipients;
    MSGraphRecipientCollection* _ccRecipients;
    MSGraphRecipientCollection* _bccRecipients;
    MSGraphRecipientCollection* _replyTo;
    NSString* _conversationId;
    MSGraphItemBody* _uniqueBody;
    BOOL _isDeliveryReceiptRequested;
    BOOL _isReadReceiptRequested;
    BOOL _isRead;
    BOOL _isDraft;
    NSString* _webLink;
    MSGraphAttachmentCollection* _attachments;
}
@end

@implementation MSGraphMessage

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.message";
    }
    return self;
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
- (NSDate*) sentDateTime
{
    if(!_sentDateTime){
        _sentDateTime = [NSDate ms_dateFromString: self.dictionary[@"sentDateTime"]];
    }
    return _sentDateTime;
}
- (void) setSentDateTime: (NSDate*) val
{
    _sentDateTime = val;
    self.dictionary[@"sentDateTime"] = val;
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
- (NSString*) internetMessageId
{
    return self.dictionary[@"internetMessageId"];
}
- (void) setInternetMessageId: (NSString*) val
{
    self.dictionary[@"internetMessageId"] = val;
}
- (NSString*) subject
{
    return self.dictionary[@"subject"];
}
- (void) setSubject: (NSString*) val
{
    self.dictionary[@"subject"] = val;
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
- (NSString*) bodyPreview
{
    return self.dictionary[@"bodyPreview"];
}
- (void) setBodyPreview: (NSString*) val
{
    self.dictionary[@"bodyPreview"] = val;
}
- (MSGraphImportance) importance
{
    _importance = [self.dictionary[@"importance"] toMSGraphImportance];
    return _importance;
}
- (void) setImportance: (MSGraphImportance) val
{
    _importance = val;
    self.dictionary[@"importance"] = [NSString stringWithMSGraphImportance:val];
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
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
- (MSGraphRecipientCollection*) toRecipients
{
    if(!_toRecipients){
        
    NSMutableArray *toRecipientsCollection = [NSMutableArray array];
    NSArray *toRecipientss = self.dictionary[@"toRecipients"];

    if ([toRecipientss isKindOfClass:[NSArray class]]){
        for (id toRecipients in toRecipientss){
            [toRecipientsCollection addObject:toRecipients];
         }
    }

    if ([toRecipientsCollection count] > 0){
        _toRecipients = [[MSGraphRecipientCollection alloc] initWithArray:toRecipientsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _toRecipients;
}
- (void) setToRecipients: (MSGraphRecipientCollection*) val
{
    _toRecipients = val;
    self.dictionary[@"toRecipients"] = val;
}
- (MSGraphRecipientCollection*) ccRecipients
{
    if(!_ccRecipients){
        
    NSMutableArray *ccRecipientsCollection = [NSMutableArray array];
    NSArray *ccRecipientss = self.dictionary[@"ccRecipients"];

    if ([ccRecipientss isKindOfClass:[NSArray class]]){
        for (id ccRecipients in ccRecipientss){
            [ccRecipientsCollection addObject:ccRecipients];
         }
    }

    if ([ccRecipientsCollection count] > 0){
        _ccRecipients = [[MSGraphRecipientCollection alloc] initWithArray:ccRecipientsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _ccRecipients;
}
- (void) setCcRecipients: (MSGraphRecipientCollection*) val
{
    _ccRecipients = val;
    self.dictionary[@"ccRecipients"] = val;
}
- (MSGraphRecipientCollection*) bccRecipients
{
    if(!_bccRecipients){
        
    NSMutableArray *bccRecipientsCollection = [NSMutableArray array];
    NSArray *bccRecipientss = self.dictionary[@"bccRecipients"];

    if ([bccRecipientss isKindOfClass:[NSArray class]]){
        for (id bccRecipients in bccRecipientss){
            [bccRecipientsCollection addObject:bccRecipients];
         }
    }

    if ([bccRecipientsCollection count] > 0){
        _bccRecipients = [[MSGraphRecipientCollection alloc] initWithArray:bccRecipientsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _bccRecipients;
}
- (void) setBccRecipients: (MSGraphRecipientCollection*) val
{
    _bccRecipients = val;
    self.dictionary[@"bccRecipients"] = val;
}
- (MSGraphRecipientCollection*) replyTo
{
    if(!_replyTo){
        
    NSMutableArray *replyToCollection = [NSMutableArray array];
    NSArray *replyTos = self.dictionary[@"replyTo"];

    if ([replyTos isKindOfClass:[NSArray class]]){
        for (id replyTo in replyTos){
            [replyToCollection addObject:replyTo];
         }
    }

    if ([replyToCollection count] > 0){
        _replyTo = [[MSGraphRecipientCollection alloc] initWithArray:replyToCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _replyTo;
}
- (void) setReplyTo: (MSGraphRecipientCollection*) val
{
    _replyTo = val;
    self.dictionary[@"replyTo"] = val;
}
- (NSString*) conversationId
{
    return self.dictionary[@"conversationId"];
}
- (void) setConversationId: (NSString*) val
{
    self.dictionary[@"conversationId"] = val;
}
- (MSGraphItemBody*) uniqueBody
{
    if(!_uniqueBody){
        _uniqueBody = [[MSGraphItemBody alloc] initWithDictionary: self.dictionary[@"uniqueBody"] ];
    }
    return _uniqueBody;
}
- (void) setUniqueBody: (MSGraphItemBody*) val
{
    _uniqueBody = val;
    self.dictionary[@"uniqueBody"] = val;
}
- (BOOL) isDeliveryReceiptRequested
{
    _isDeliveryReceiptRequested = [self.dictionary[@"isDeliveryReceiptRequested"] boolValue];
    return _isDeliveryReceiptRequested;
}
- (void) setIsDeliveryReceiptRequested: (BOOL) val
{
    _isDeliveryReceiptRequested = val;
    self.dictionary[@"isDeliveryReceiptRequested"] = @(val);
}
- (BOOL) isReadReceiptRequested
{
    _isReadReceiptRequested = [self.dictionary[@"isReadReceiptRequested"] boolValue];
    return _isReadReceiptRequested;
}
- (void) setIsReadReceiptRequested: (BOOL) val
{
    _isReadReceiptRequested = val;
    self.dictionary[@"isReadReceiptRequested"] = @(val);
}
- (BOOL) isRead
{
    _isRead = [self.dictionary[@"isRead"] boolValue];
    return _isRead;
}
- (void) setIsRead: (BOOL) val
{
    _isRead = val;
    self.dictionary[@"isRead"] = @(val);
}
- (BOOL) isDraft
{
    _isDraft = [self.dictionary[@"isDraft"] boolValue];
    return _isDraft;
}
- (void) setIsDraft: (BOOL) val
{
    _isDraft = val;
    self.dictionary[@"isDraft"] = @(val);
}
- (NSString*) webLink
{
    return self.dictionary[@"webLink"];
}
- (void) setWebLink: (NSString*) val
{
    self.dictionary[@"webLink"] = val;
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
- (MSGraphRecipient*) toRecipients:(NSInteger)index
{
   MSGraphRecipient* toRecipients = nil;
   if (self.toRecipients.value){
       toRecipients = self.toRecipients.value[index];
   }
   return toRecipients;
}
- (MSGraphRecipient*) ccRecipients:(NSInteger)index
{
   MSGraphRecipient* ccRecipients = nil;
   if (self.ccRecipients.value){
       ccRecipients = self.ccRecipients.value[index];
   }
   return ccRecipients;
}
- (MSGraphRecipient*) bccRecipients:(NSInteger)index
{
   MSGraphRecipient* bccRecipients = nil;
   if (self.bccRecipients.value){
       bccRecipients = self.bccRecipients.value[index];
   }
   return bccRecipients;
}
- (MSGraphRecipient*) replyTo:(NSInteger)index
{
   MSGraphRecipient* replyTo = nil;
   if (self.replyTo.value){
       replyTo = self.replyTo.value[index];
   }
   return replyTo;
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
