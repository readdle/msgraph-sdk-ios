// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphMessage; 
#import "MSGraphMessageCollection.h"
#import "MSGraphMailFolderCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphMailFolder : MSGraphEntity

  @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setParentFolderId:, getter=parentFolderId) NSString* parentFolderId;
    @property (nonatomic, setter=setChildFolderCount:, getter=childFolderCount) int32_t childFolderCount;
    @property (nonatomic, setter=setUnreadItemCount:, getter=unreadItemCount) int32_t unreadItemCount;
    @property (nonatomic, setter=setTotalItemCount:, getter=totalItemCount) int32_t totalItemCount;
    @property (nonatomic, setter=setMessages:, getter=messages) MSGraphMessageCollection* messages;
    @property (nonatomic, setter=setChildFolders:, getter=childFolders) MSGraphMailFolderCollection* childFolders;
  - (MSGraphMessage*) messages:(NSInteger)index;
- (MSGraphMailFolder*) childFolders:(NSInteger)index;

@end
