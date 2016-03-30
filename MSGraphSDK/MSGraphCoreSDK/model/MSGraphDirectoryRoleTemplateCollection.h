// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDirectoryRoleTemplate;

@interface MSGraphDirectoryRoleTemplateCollection : MSCollection

+ (MSGraphDirectoryRoleTemplateCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDirectoryRoleTemplate*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
