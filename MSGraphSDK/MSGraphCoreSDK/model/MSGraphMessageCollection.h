// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphMessage;

@interface MSGraphMessageCollection : MSCollection

+ (MSGraphMessageCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphMessage*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
