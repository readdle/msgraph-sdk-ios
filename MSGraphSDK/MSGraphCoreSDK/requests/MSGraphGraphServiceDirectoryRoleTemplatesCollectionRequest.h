// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryRoleTemplateCollection.h"

@class MSGraphDirectoryRoleTemplateRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryRoleTemplateCompletionHandler)(MSGraphDirectoryRoleTemplate *response, NSError *error);

typedef void (^MSGraphDirectoryRoleTemplatesCollectionCompletionHandler)(MSGraphDirectoryRoleTemplateCollection* response, MSGraphDirectoryRoleTemplatesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDirectoryRoleTemplatesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDirectoryRoleTemplatesCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addDirectoryRoleTemplate:(MSGraphDirectoryRoleTemplate*)directoryRoleTemplate withCompletion:(MSGraphDirectoryRoleTemplateCompletionHandler)completionHandler;

@end
