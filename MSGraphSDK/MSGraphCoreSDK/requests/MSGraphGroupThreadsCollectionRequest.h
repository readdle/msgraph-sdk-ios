// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphConversationThreadCollection.h"

@class MSGraphConversationThreadRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphConversationThreadCompletionHandler)(MSGraphConversationThread *response, NSError *error);

typedef void (^MSGraphGroupThreadsCollectionCompletionHandler)(MSGraphConversationThreadCollection* response, MSGraphGroupThreadsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphGroupThreadsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphGroupThreadsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addConversationThread:(MSGraphConversationThread*)conversationThread withCompletion:(MSGraphConversationThreadCompletionHandler)completionHandler;

@end
