// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphCalendarCollection.h"
#import "MSGraphCalendar.h"

@implementation MSGraphCalendarCollection

+ (MSGraphCalendarCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphCalendarCollection *col = [[MSGraphCalendarCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphCalendar*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphCalendar alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
