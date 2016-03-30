// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphSubscribedSkuCollection.h"

@class MSGraphSubscribedSkuRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphSubscribedSkuCompletionHandler)(MSGraphSubscribedSku *response, NSError *error);

typedef void (^MSGraphSubscribedSkusCollectionCompletionHandler)(MSGraphSubscribedSkuCollection* response, MSGraphSubscribedSkusCollectionRequest *nextRequest, NSError *error);

@interface MSGraphSubscribedSkusCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphSubscribedSkusCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addSubscribedSku:(MSGraphSubscribedSku*)subscribedSku withCompletion:(MSGraphSubscribedSkuCompletionHandler)completionHandler;

@end
