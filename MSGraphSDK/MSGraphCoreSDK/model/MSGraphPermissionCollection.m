// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphPermissionCollection.h"
#import "MSGraphPermission.h"

@implementation MSGraphPermissionCollection

+ (MSGraphPermissionCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphPermissionCollection *col = [[MSGraphPermissionCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphPermission*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphPermission alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
