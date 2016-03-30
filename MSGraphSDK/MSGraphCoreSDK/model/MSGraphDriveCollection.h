// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDrive;

@interface MSGraphDriveCollection : MSCollection

+ (MSGraphDriveCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDrive*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
