// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphIdentitySet, MSGraphSharingInvitation, MSGraphItemReference, MSGraphSharingLink; 
#import "MSCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphPermission : MSGraphEntity

  @property (nonatomic, setter=setGrantedTo:, getter=grantedTo) MSGraphIdentitySet* grantedTo;
    @property (nonatomic, setter=setInvitation:, getter=invitation) MSGraphSharingInvitation* invitation;
    @property (nonatomic, setter=setInheritedFrom:, getter=inheritedFrom) MSGraphItemReference* inheritedFrom;
    @property (nonatomic, setter=setLink:, getter=link) MSGraphSharingLink* link;
    @property (nonatomic, setter=setRoles:, getter=roles) MSCollection* roles;
    @property (nonatomic, setter=setShareId:, getter=shareId) NSString* shareId;
  - (NSString*) roles:(NSInteger)index;

@end
