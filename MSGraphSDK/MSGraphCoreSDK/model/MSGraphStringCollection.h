// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"

@interface MSGraphStringCollection : MSCollection

+ (MSGraphStringCollection *) fromMSCollection:(MSCollection *)collection;
- (NSString*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
