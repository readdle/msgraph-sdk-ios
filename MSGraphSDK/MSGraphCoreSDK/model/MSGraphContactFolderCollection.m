// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphContactFolderCollection.h"
#import "MSGraphContactFolder.h"

@implementation MSGraphContactFolderCollection

+ (MSGraphContactFolderCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphContactFolderCollection *col = [[MSGraphContactFolderCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphContactFolder*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphContactFolder alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
