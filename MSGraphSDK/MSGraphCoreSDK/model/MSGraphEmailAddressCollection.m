// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphEmailAddressCollection.h"
#import "MSGraphEmailAddress.h"

@implementation MSGraphEmailAddressCollection

+ (MSGraphEmailAddressCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphEmailAddressCollection *col = [[MSGraphEmailAddressCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphEmailAddress*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphEmailAddress alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
