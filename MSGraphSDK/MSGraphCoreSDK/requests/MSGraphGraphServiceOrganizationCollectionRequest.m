// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphOrganizationCollectionRequest

- (MSURLSessionDataTask *)MSGraphOrganizationCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphOrganizationCollection* response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphOrganizationCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphOrganizationCollectionCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self MSGraphOrganizationCollectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [response copy];
                                         }
                                                        completion:^(MSGraphOrganizationCollection* collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphOrganizationCollectionRequest *nextRequest = [[MSGraphOrganizationCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addOrganization:(MSGraphOrganization*)organization
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[organization dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addOrganization:(MSGraphOrganization*)organization withCompletion:(MSGraphOrganizationCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addOrganization:organization]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphOrganization alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
