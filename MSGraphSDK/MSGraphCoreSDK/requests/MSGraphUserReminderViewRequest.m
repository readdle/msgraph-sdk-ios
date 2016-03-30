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

@interface MSGraphUserReminderViewRequest()


@property (nonatomic, getter=startDateTime) NSString * startDateTime;


@property (nonatomic, getter=endDateTime) NSString * endDateTime;

@end

@implementation MSGraphUserReminderViewRequest


- (instancetype)initWithStartDateTime:(NSString *)startDateTime endDateTime:(NSString *)endDateTime URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    NSParameterAssert(startDateTime);
    self = [super initWithURL:url options:options client:client];
    if (self){
        _startDateTime = startDateTime;
        _endDateTime = endDateTime;
    }
    return self;
}

- (MSURLSessionDataTask *)MSGraphReminderCollectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSGraphReminderCollection *response, NSError *error))completionHandler
{
    return [self collectionTaskWithRequest: request odObjectWithDictionary:castBlock
    completion:^(MSCollection* collectionResponse, NSError *error){
        completionHandler([MSGraphReminderCollection fromMSCollection:collectionResponse],error);
    }];
}

- (NSMutableURLRequest *)mutableRequest
{
    [self.options addObject:[[MSFunctionParameters alloc] initWithKey:@"StartDateTime"
                                                                value:[MSObject getNSJsonSerializationCompatibleValue:_startDateTime]]];
    [self.options addObject:[[MSFunctionParameters alloc] initWithKey:@"EndDateTime"
                                                                value:[MSObject getNSJsonSerializationCompatibleValue:_endDateTime]]];

    return [self requestWithMethod:@"GET" body:nil headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphReminderCollection *response, MSGraphUserReminderViewRequest *nextRequest, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self MSGraphReminderCollectionTaskWithRequest:self.mutableRequest
                                                         odObjectWithDictionary:^(id responseObject){
                                                                                    return [responseObject copy];
                                                                                }
                                                                     completion:^(MSGraphReminderCollection *collectionResponse, NSError *error){
                                      if(!error && collectionResponse.nextLink && completionHandler){
                                              MSGraphUserReminderViewRequest *nextRequest = [[MSGraphUserReminderViewRequest alloc] initWithURL:collectionResponse.nextLink
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
