// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphMailFolderCollection.h"
#import "MSGraphMailFolder.h"

@implementation MSGraphMailFolderCollection

+ (MSGraphMailFolderCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphMailFolderCollection *col = [[MSGraphMailFolderCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphMailFolder*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphMailFolder alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
