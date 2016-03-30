// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphIdentitySet, MSGraphQuota, MSGraphDriveItem; 
#import "MSGraphDriveItemCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphDrive : MSGraphEntity

  @property (nonatomic, setter=setDriveType:, getter=driveType) NSString* driveType;
    @property (nonatomic, setter=setOwner:, getter=owner) MSGraphIdentitySet* owner;
    @property (nonatomic, setter=setQuota:, getter=quota) MSGraphQuota* quota;
    @property (nonatomic, setter=setItems:, getter=items) MSGraphDriveItemCollection* items;
    @property (nonatomic, setter=setSpecial:, getter=special) MSGraphDriveItemCollection* special;
    @property (nonatomic, setter=setRoot:, getter=root) MSGraphDriveItem* root;
  - (MSGraphDriveItem*) items:(NSInteger)index;
- (MSGraphDriveItem*) special:(NSInteger)index;

@end
