// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphContact; 
#import "MSGraphContactCollection.h"
#import "MSGraphContactFolderCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphContactFolder : MSGraphEntity

  @property (nonatomic, setter=setParentFolderId:, getter=parentFolderId) NSString* parentFolderId;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setContacts:, getter=contacts) MSGraphContactCollection* contacts;
    @property (nonatomic, setter=setChildFolders:, getter=childFolders) MSGraphContactFolderCollection* childFolders;
  - (MSGraphContact*) contacts:(NSInteger)index;
- (MSGraphContactFolder*) childFolders:(NSInteger)index;

@end
