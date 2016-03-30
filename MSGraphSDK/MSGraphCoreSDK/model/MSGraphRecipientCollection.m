// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphRecipientCollection.h"
#import "MSGraphRecipient.h"

@implementation MSGraphRecipientCollection

+ (MSGraphRecipientCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphRecipientCollection *col = [[MSGraphRecipientCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphRecipient*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphRecipient alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
