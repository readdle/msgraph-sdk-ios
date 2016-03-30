// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphDirectoryRoleTemplatesCollectionRequest

- (MSURLSessionDataTask *)MSGraphDirectoryRoleTemplateCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphDirectoryRoleTemplateCollection* response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphDirectoryRoleTemplateCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDirectoryRoleTemplatesCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self MSGraphDirectoryRoleTemplateCollectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [response copy];
                                         }
                                                        completion:^(MSGraphDirectoryRoleTemplateCollection* collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphDirectoryRoleTemplatesCollectionRequest *nextRequest = [[MSGraphDirectoryRoleTemplatesCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addDirectoryRoleTemplate:(MSGraphDirectoryRoleTemplate*)directoryRoleTemplate
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[directoryRoleTemplate dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addDirectoryRoleTemplate:(MSGraphDirectoryRoleTemplate*)directoryRoleTemplate withCompletion:(MSGraphDirectoryRoleTemplateCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addDirectoryRoleTemplate:directoryRoleTemplate]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphDirectoryRoleTemplate alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
