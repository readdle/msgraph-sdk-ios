// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDriveCollection.h"
#import "MSGraphDrive.h"

@implementation MSGraphDriveCollection

+ (MSGraphDriveCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDriveCollection *col = [[MSGraphDriveCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDrive*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDrive alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
