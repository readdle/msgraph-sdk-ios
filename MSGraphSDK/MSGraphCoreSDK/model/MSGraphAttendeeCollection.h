// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphAttendee;

@interface MSGraphAttendeeCollection : MSCollection

+ (MSGraphAttendeeCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphAttendee*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
