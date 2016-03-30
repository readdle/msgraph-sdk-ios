// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphOrganizationCollection.h"

@class MSGraphOrganizationRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphOrganizationCompletionHandler)(MSGraphOrganization *response, NSError *error);

typedef void (^MSGraphOrganizationCollectionCollectionCompletionHandler)(MSGraphOrganizationCollection* response, MSGraphOrganizationCollectionRequest *nextRequest, NSError *error);

@interface MSGraphOrganizationCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphOrganizationCollectionCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addOrganization:(MSGraphOrganization*)organization withCompletion:(MSGraphOrganizationCompletionHandler)completionHandler;

@end
