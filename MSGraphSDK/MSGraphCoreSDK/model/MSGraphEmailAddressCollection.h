// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphEmailAddress;

@interface MSGraphEmailAddressCollection : MSCollection

+ (MSGraphEmailAddressCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphEmailAddress*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
