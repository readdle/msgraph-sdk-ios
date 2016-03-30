// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphConversationThread;

@interface MSGraphConversationThreadCollection : MSCollection

+ (MSGraphConversationThreadCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphConversationThread*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
