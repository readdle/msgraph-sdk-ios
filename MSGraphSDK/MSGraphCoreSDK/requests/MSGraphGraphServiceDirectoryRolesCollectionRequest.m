// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphDirectoryRolesCollectionRequest

- (MSURLSessionDataTask *)MSGraphDirectoryRoleCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphDirectoryRoleCollection* response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphDirectoryRoleCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDirectoryRolesCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self MSGraphDirectoryRoleCollectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [response copy];
                                         }
                                                        completion:^(MSGraphDirectoryRoleCollection* collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphDirectoryRolesCollectionRequest *nextRequest = [[MSGraphDirectoryRolesCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addDirectoryRole:(MSGraphDirectoryRole*)directoryRole
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[directoryRole dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addDirectoryRole:(MSGraphDirectoryRole*)directoryRole withCompletion:(MSGraphDirectoryRoleCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addDirectoryRole:directoryRole]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphDirectoryRole alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
