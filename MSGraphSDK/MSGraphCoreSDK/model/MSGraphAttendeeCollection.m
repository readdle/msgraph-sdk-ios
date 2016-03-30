// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAttendeeCollection.h"
#import "MSGraphAttendee.h"

@implementation MSGraphAttendeeCollection

+ (MSGraphAttendeeCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphAttendeeCollection *col = [[MSGraphAttendeeCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphAttendee*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphAttendee alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
