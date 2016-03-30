// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphConversation;

@interface MSGraphConversationCollection : MSCollection

+ (MSGraphConversationCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphConversation*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
