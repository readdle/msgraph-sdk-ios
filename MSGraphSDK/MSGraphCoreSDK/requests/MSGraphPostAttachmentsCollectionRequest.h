// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAttachmentCollection.h"

@class MSGraphAttachmentRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphAttachmentCompletionHandler)(MSGraphAttachment *response, NSError *error);

typedef void (^MSGraphPostAttachmentsCollectionCompletionHandler)(MSGraphAttachmentCollection* response, MSGraphPostAttachmentsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphPostAttachmentsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphPostAttachmentsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addAttachment:(MSGraphAttachment*)attachment withCompletion:(MSGraphAttachmentCompletionHandler)completionHandler;

@end
