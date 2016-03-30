// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphOrganization;

@interface MSGraphOrganizationCollection : MSCollection

+ (MSGraphOrganizationCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphOrganization*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
