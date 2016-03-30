// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphUser;

@interface MSGraphUserCollection : MSCollection

+ (MSGraphUserCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphUser*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
