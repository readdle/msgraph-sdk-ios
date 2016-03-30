// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphVerifiedDomainCollection.h"
#import "MSGraphVerifiedDomain.h"

@implementation MSGraphVerifiedDomainCollection

+ (MSGraphVerifiedDomainCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphVerifiedDomainCollection *col = [[MSGraphVerifiedDomainCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphVerifiedDomain*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphVerifiedDomain alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
