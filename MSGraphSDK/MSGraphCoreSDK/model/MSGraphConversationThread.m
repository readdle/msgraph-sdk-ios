// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphConversationThread()
{
    MSGraphRecipientCollection* _toRecipients;
    NSString* _topic;
    BOOL _hasAttachments;
    NSDate* _lastDeliveredDateTime;
    MSCollection* _uniqueSenders;
    MSGraphRecipientCollection* _ccRecipients;
    NSString* _preview;
    BOOL _isLocked;
    MSGraphPostCollection* _posts;
}
@end

@implementation MSGraphConversationThread

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.conversationThread";
    }
    return self;
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
- (NSString*) topic
{
    return self.dictionary[@"topic"];
}
- (void) setTopic: (NSString*) val
{
    self.dictionary[@"topic"] = val;
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
- (NSDate*) lastDeliveredDateTime
{
    if(!_lastDeliveredDateTime){
        _lastDeliveredDateTime = [NSDate ms_dateFromString: self.dictionary[@"lastDeliveredDateTime"]];
    }
    return _lastDeliveredDateTime;
}
- (void) setLastDeliveredDateTime: (NSDate*) val
{
    _lastDeliveredDateTime = val;
    self.dictionary[@"lastDeliveredDateTime"] = val;
}
- (MSCollection*) uniqueSenders
{
    return self.dictionary[@"uniqueSenders"];
}
- (void) setUniqueSenders: (MSCollection*) val
{
    self.dictionary[@"uniqueSenders"] = val;
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
- (NSString*) preview
{
    return self.dictionary[@"preview"];
}
- (void) setPreview: (NSString*) val
{
    self.dictionary[@"preview"] = val;
}
- (BOOL) isLocked
{
    _isLocked = [self.dictionary[@"isLocked"] boolValue];
    return _isLocked;
}
- (void) setIsLocked: (BOOL) val
{
    _isLocked = val;
    self.dictionary[@"isLocked"] = @(val);
}
- (MSGraphPostCollection*) posts
{
    if(!_posts){
        
    NSMutableArray *postsCollection = [NSMutableArray array];
    NSArray *postss = self.dictionary[@"posts"];

    if ([postss isKindOfClass:[NSArray class]]){
        for (id posts in postss){
            [postsCollection addObject:posts];
         }
    }

    if ([postsCollection count] > 0){
        _posts = [[MSGraphPostCollection alloc] initWithArray:postsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _posts;
}
- (void) setPosts: (MSGraphPostCollection*) val
{
    _posts = val;
    self.dictionary[@"posts"] = val;
}
- (MSGraphRecipient*) toRecipients:(NSInteger)index
{
   MSGraphRecipient* toRecipients = nil;
   if (self.toRecipients.value){
       toRecipients = self.toRecipients.value[index];
   }
   return toRecipients;
}
- (NSString*) uniqueSenders:(NSInteger)index
{
   NSString* uniqueSenders = nil;
   if (self.uniqueSenders.value){
       uniqueSenders = self.uniqueSenders.value[index];
   }
   return uniqueSenders;
}
- (MSGraphRecipient*) ccRecipients:(NSInteger)index
{
   MSGraphRecipient* ccRecipients = nil;
   if (self.ccRecipients.value){
       ccRecipients = self.ccRecipients.value[index];
   }
   return ccRecipients;
}
- (MSGraphPost*) posts:(NSInteger)index
{
   MSGraphPost* posts = nil;
   if (self.posts.value){
       posts = self.posts.value[index];
   }
   return posts;
}

@end
