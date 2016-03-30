// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphAssignedLicense;

@interface MSGraphAssignedLicenseCollection : MSCollection

+ (MSGraphAssignedLicenseCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphAssignedLicense*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
