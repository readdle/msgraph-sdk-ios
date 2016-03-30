// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDeviceCollection.h"
#import "MSGraphDevice.h"

@implementation MSGraphDeviceCollection

+ (MSGraphDeviceCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphDeviceCollection *col = [[MSGraphDeviceCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphDevice*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphDevice alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end
