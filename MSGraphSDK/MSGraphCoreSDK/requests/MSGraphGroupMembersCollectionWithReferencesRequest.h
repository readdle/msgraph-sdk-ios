// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryObjectCollection.h"

@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphGroupMembersCollectionWithReferencesCompletionHandler)(MSGraphDirectoryObjectCollection* response, MSGraphGroupMembersCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphGroupMembersCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphGroupMembersCollectionWithReferencesCompletionHandler)completionHandler;
@end
