// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAlternativeSecurityIdCollection.h"
#import "MSGraphAlternativeSecurityId.h"

@implementation MSGraphAlternativeSecurityIdCollection

+ (MSGraphAlternativeSecurityIdCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphAlternativeSecurityIdCollection *col = [[MSGraphAlternativeSecurityIdCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphAlternativeSecurityId*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphAlternativeSecurityId alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
