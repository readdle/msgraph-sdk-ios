// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphPermission;

@interface MSGraphPermissionCollection : MSCollection

+ (MSGraphPermissionCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphPermission*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
