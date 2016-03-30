// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphContactFolder;

@interface MSGraphContactFolderCollection : MSCollection

+ (MSGraphContactFolderCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphContactFolder*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
