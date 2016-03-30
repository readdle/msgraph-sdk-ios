// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphPostCollection.h"
#import "MSGraphPost.h"

@implementation MSGraphPostCollection

+ (MSGraphPostCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphPostCollection *col = [[MSGraphPostCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphPost*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphPost alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
