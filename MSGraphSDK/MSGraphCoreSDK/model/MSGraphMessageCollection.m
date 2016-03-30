// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphMessageCollection.h"
#import "MSGraphMessage.h"

@implementation MSGraphMessageCollection

+ (MSGraphMessageCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphMessageCollection *col = [[MSGraphMessageCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphMessage*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphMessage alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
