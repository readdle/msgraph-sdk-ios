// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphUserCollection.h"
#import "MSGraphUser.h"

@implementation MSGraphUserCollection

+ (MSGraphUserCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphUserCollection *col = [[MSGraphUserCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphUser*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphUser alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
