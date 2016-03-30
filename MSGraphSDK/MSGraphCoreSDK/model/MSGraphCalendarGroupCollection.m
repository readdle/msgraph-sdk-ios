// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphCalendarGroupCollection.h"
#import "MSGraphCalendarGroup.h"

@implementation MSGraphCalendarGroupCollection

+ (MSGraphCalendarGroupCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphCalendarGroupCollection *col = [[MSGraphCalendarGroupCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphCalendarGroup*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphCalendarGroup alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
