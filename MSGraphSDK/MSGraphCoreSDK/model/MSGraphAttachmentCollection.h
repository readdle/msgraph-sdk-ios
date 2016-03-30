// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphAttachment;

@interface MSGraphAttachmentCollection : MSCollection

+ (MSGraphAttachmentCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphAttachment*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end
