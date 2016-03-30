// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphStringCollection.h"

@implementation MSGraphStringCollection

+ (MSGraphStringCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphStringCollection *col = [[MSGraphStringCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (NSString*) objectAtIndex:(NSUInteger)index {
    return [super.value objectAtIndex:index];

}

- (NSUInteger) count {
    return [super.value count];
}

@end
