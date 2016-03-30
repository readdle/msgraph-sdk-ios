// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphDevicesCollectionRequest

- (MSURLSessionDataTask *)MSGraphDeviceCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphDeviceCollection* response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphDeviceCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDevicesCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self MSGraphDeviceCollectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [response copy];
                                         }
                                                        completion:^(MSGraphDeviceCollection* collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphDevicesCollectionRequest *nextRequest = [[MSGraphDevicesCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addDevice:(MSGraphDevice*)device
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[device dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addDevice:(MSGraphDevice*)device withCompletion:(MSGraphDeviceCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addDevice:device]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphDevice alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
