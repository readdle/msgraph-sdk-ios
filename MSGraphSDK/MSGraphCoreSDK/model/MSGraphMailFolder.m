// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphMailFolder()
{
    NSString* _displayName;
    NSString* _parentFolderId;
    int32_t _childFolderCount;
    int32_t _unreadItemCount;
    int32_t _totalItemCount;
    MSGraphMessageCollection* _messages;
    MSGraphMailFolderCollection* _childFolders;
}
@end

@implementation MSGraphMailFolder

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.mailFolder";
    }
    return self;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
}
- (int32_t) childFolderCount
{
    _childFolderCount = [self.dictionary[@"childFolderCount"] intValue];
    return _childFolderCount;
}
- (void) setChildFolderCount: (int32_t) val
{
    _childFolderCount = val;
    self.dictionary[@"childFolderCount"] = @(val);
}
- (int32_t) unreadItemCount
{
    _unreadItemCount = [self.dictionary[@"unreadItemCount"] intValue];
    return _unreadItemCount;
}
- (void) setUnreadItemCount: (int32_t) val
{
    _unreadItemCount = val;
    self.dictionary[@"unreadItemCount"] = @(val);
}
- (int32_t) totalItemCount
{
    _totalItemCount = [self.dictionary[@"totalItemCount"] intValue];
    return _totalItemCount;
}
- (void) setTotalItemCount: (int32_t) val
{
    _totalItemCount = val;
    self.dictionary[@"totalItemCount"] = @(val);
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
- (MSGraphMailFolderCollection*) childFolders
{
    if(!_childFolders){
        
    NSMutableArray *childFoldersCollection = [NSMutableArray array];
    NSArray *childFolderss = self.dictionary[@"childFolders"];

    if ([childFolderss isKindOfClass:[NSArray class]]){
        for (id childFolders in childFolderss){
            [childFoldersCollection addObject:childFolders];
         }
    }

    if ([childFoldersCollection count] > 0){
        _childFolders = [[MSGraphMailFolderCollection alloc] initWithArray:childFoldersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _childFolders;
}
- (void) setChildFolders: (MSGraphMailFolderCollection*) val
{
    _childFolders = val;
    self.dictionary[@"childFolders"] = val;
}
- (MSGraphMessage*) messages:(NSInteger)index
{
   MSGraphMessage* messages = nil;
   if (self.messages.value){
       messages = self.messages.value[index];
   }
   return messages;
}
- (MSGraphMailFolder*) childFolders:(NSInteger)index
{
   MSGraphMailFolder* childFolders = nil;
   if (self.childFolders.value){
       childFolders = self.childFolders.value[index];
   }
   return childFolders;
}

@end
