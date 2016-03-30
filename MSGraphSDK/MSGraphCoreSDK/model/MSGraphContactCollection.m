// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphContactCollection.h"
#import "MSGraphContact.h"

@implementation MSGraphContactCollection

+ (MSGraphContactCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphContactCollection *col = [[MSGraphContactCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphContact*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphContact alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
