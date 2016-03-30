// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphGroupCollection.h"
#import "MSGraphGroup.h"

@implementation MSGraphGroupCollection

+ (MSGraphGroupCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphGroupCollection *col = [[MSGraphGroupCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphGroup*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphGroup alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
