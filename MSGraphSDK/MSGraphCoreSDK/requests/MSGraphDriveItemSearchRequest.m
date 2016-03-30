// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSURLSessionDataTask.h"


#import "MSFunctionParameters.h"



@interface MSRequest()

@property NSMutableArray *options;

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;

@end

@interface MSGraphDriveItemSearchRequest()


@property (nonatomic, getter=q) NSString * q;

@end

@implementation MSGraphDriveItemSearchRequest


- (instancetype)initWithQ:(NSString *)q URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    self = [super initWithURL:url options:options client:client];
    if (self){
        _q = q;
    }
    return self;
}

- (MSURLSessionDataTask *)MSGraphDriveItemCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphDriveItemCollection *response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphDriveItemCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)mutableRequest
{
    [self.options addObject:[[MSFunctionParameters alloc] initWithKey:@"q"
                                                                value:[MSObject getNSJsonSerializationCompatibleValue:_q]]];

    return [self requestWithMethod:@"GET" body:nil headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphDriveItemCollection *response, MSGraphDriveItemSearchRequest *nextRequest, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self MSGraphDriveItemCollectionTaskWithRequest:self.mutableRequest
                                                          odObjectWithDictionary:^(id responseObject){
                                                                                     return [responseObject copy];
                                                                                 }
                                                                      completion:^(MSGraphDriveItemCollection *collectionResponse, NSError *error){
                                      if(!error && collectionResponse.nextLink && completionHandler){
                                              MSGraphDriveItemSearchRequest *nextRequest = [[MSGraphDriveItemSearchRequest alloc] initWithURL:collectionResponse.nextLink
                                                                                                                  options:nil
                                                                                                                  client:self.client];
                                          completionHandler(collectionResponse, nextRequest, nil);
                                      }
                                      else if(completionHandler){
                                          completionHandler(collectionResponse, nil, error);
                                      }
                                  }];
    [task execute];
    return task;
}

@end
