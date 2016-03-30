// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryRoleTemplateCollection.h"
#import "MSGraphDirectoryRoleTemplate.h"

@implementation MSGraphDirectoryRoleTemplateCollection

+ (MSGraphDirectoryRoleTemplateCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDirectoryRoleTemplateCollection *col = [[MSGraphDirectoryRoleTemplateCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDirectoryRoleTemplate*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDirectoryRoleTemplate alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
