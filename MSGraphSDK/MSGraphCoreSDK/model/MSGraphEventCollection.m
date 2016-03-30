// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphEventCollection.h"
#import "MSGraphEvent.h"

@implementation MSGraphEventCollection

+ (MSGraphEventCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphEventCollection *col = [[MSGraphEventCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphEvent*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphEvent alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
