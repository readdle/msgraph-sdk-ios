// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDayOfWeekCollection.h"

@implementation MSGraphDayOfWeekCollection

+ (MSGraphDayOfWeekCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDayOfWeekCollection *col = [[MSGraphDayOfWeekCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDayOfWeek) objectAtIndex:(NSUInteger)index {
    return [[super.value objectAtIndex:index] toMSGraphDayOfWeek];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
