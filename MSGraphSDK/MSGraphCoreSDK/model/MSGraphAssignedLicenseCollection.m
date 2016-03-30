// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAssignedLicenseCollection.h"
#import "MSGraphAssignedLicense.h"

@implementation MSGraphAssignedLicenseCollection

+ (MSGraphAssignedLicenseCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphAssignedLicenseCollection *col = [[MSGraphAssignedLicenseCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphAssignedLicense*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphAssignedLicense alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
