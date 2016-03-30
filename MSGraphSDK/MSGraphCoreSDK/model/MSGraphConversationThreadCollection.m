// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphConversationThreadCollection.h"
#import "MSGraphConversationThread.h"

@implementation MSGraphConversationThreadCollection

+ (MSGraphConversationThreadCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphConversationThreadCollection *col = [[MSGraphConversationThreadCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphConversationThread*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphConversationThread alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
