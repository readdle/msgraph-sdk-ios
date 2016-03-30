// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphOrganizationCollection.h"
#import "MSGraphOrganization.h"

@implementation MSGraphOrganizationCollection

+ (MSGraphOrganizationCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphOrganizationCollection *col = [[MSGraphOrganizationCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphOrganization*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphOrganization alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
