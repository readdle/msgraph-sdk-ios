// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphMailFolder;

@interface MSGraphMailFolderCollection : MSCollection

+ (MSGraphMailFolderCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphMailFolder*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
