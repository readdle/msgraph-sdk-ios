// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphReminderCollection.h"
#import "MSGraphReminder.h"

@implementation MSGraphReminderCollection

+ (MSGraphReminderCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphReminderCollection *col = [[MSGraphReminderCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphReminder*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphReminder alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
