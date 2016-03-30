// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphThumbnailSetCollection.h"
#import "MSGraphThumbnailSet.h"

@implementation MSGraphThumbnailSetCollection

+ (MSGraphThumbnailSetCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphThumbnailSetCollection *col = [[MSGraphThumbnailSetCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphThumbnailSet*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphThumbnailSet alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
