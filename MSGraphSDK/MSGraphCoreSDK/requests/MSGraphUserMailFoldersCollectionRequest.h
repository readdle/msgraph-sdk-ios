// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphMailFolderCollection.h"

@class MSGraphMailFolderRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphMailFolderCompletionHandler)(MSGraphMailFolder *response, NSError *error);

typedef void (^MSGraphUserMailFoldersCollectionCompletionHandler)(MSGraphMailFolderCollection* response, MSGraphUserMailFoldersCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserMailFoldersCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserMailFoldersCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addMailFolder:(MSGraphMailFolder*)mailFolder withCompletion:(MSGraphMailFolderCompletionHandler)completionHandler;

@end
