// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphPost;

@interface MSGraphPostCollection : MSCollection

+ (MSGraphPostCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphPost*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
