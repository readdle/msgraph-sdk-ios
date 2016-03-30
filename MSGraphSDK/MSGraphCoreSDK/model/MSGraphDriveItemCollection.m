// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDriveItemCollection.h"
#import "MSGraphDriveItem.h"

@implementation MSGraphDriveItemCollection

+ (MSGraphDriveItemCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDriveItemCollection *col = [[MSGraphDriveItemCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDriveItem*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDriveItem alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
