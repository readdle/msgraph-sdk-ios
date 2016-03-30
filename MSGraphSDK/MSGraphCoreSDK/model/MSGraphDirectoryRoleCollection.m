// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryRoleCollection.h"
#import "MSGraphDirectoryRole.h"

@implementation MSGraphDirectoryRoleCollection

+ (MSGraphDirectoryRoleCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDirectoryRoleCollection *col = [[MSGraphDirectoryRoleCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDirectoryRole*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDirectoryRole alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
