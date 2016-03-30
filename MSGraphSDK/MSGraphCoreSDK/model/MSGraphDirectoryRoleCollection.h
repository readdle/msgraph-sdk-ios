// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDirectoryRole;

@interface MSGraphDirectoryRoleCollection : MSCollection

+ (MSGraphDirectoryRoleCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDirectoryRole*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
