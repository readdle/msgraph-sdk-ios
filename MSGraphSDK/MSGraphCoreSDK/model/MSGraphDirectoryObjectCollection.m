// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryObjectCollection.h"
#import "MSGraphDirectoryObject.h"

@implementation MSGraphDirectoryObjectCollection

+ (MSGraphDirectoryObjectCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDirectoryObjectCollection *col = [[MSGraphDirectoryObjectCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDirectoryObject*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDirectoryObject alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
