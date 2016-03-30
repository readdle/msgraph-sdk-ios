// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAttachmentCollection.h"
#import "MSGraphAttachment.h"

@implementation MSGraphAttachmentCollection

+ (MSGraphAttachmentCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphAttachmentCollection *col = [[MSGraphAttachmentCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphAttachment*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphAttachment alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
