// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


#import "MSGraphModels.h"
#import "MSGraphODataEntities.h"
#import "MSURLSessionDownloadTask.h"
#import "MSURLSessionUploadTask.h"

@interface MSRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;

@end

@interface MSGraphDriveItemContentRequest ()

@property (nonatomic, assign) BOOL skipAuthentication;
@property (nonatomic, assign) BOOL skipHeadersInheritance;

@end

@implementation MSGraphDriveItemContentRequest

- (instancetype)initWithDownloadURL:(NSURL *)url client:(ODataBaseClient *)client {
    self = [super initWithURL:url client:client];
    if (self != nil) {
        // EXP-11490
        // no need to add authorization headers when using direct download url
        // furthermore, it can cause "unauthorized error"
        // so we skip authorization
        _skipAuthentication = YES;
    }
    return self;
}

- (instancetype)initWithDownloadURL:(NSURL *)url
                             client:(ODataBaseClient *)client
             skipHeadersInheritance:(BOOL)skipHeadersInheritance
{
    self = [super initWithURL:url client:client];
    
    if (nil != self) {
        _skipAuthentication = NO;
        _skipHeadersInheritance = skipHeadersInheritance;
    }
    
    return self;
}

- (NSMutableURLRequest *) download
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDownloadTask *) downloadWithCompletion:(MSDownloadCompletionHandler)completionHandler
{
    MSURLSessionDownloadTask *task = [[MSURLSessionDownloadTask alloc] initWithRequest:[self download]
                                                                                client:self.client
                                                                    skipAuthentication:self.skipAuthentication
                                                                skipHeadersInheritance:self.skipHeadersInheritance
                                                                     completionHandler:completionHandler];
    [task execute];
    return task;
}

- (NSMutableURLRequest *) upload
{
    //when creating an upload task the body will be reset
    return [self requestWithMethod:@"PUT"
                              body:nil
                           headers:nil];
}

- (MSURLSessionUploadTask *) uploadFromData:(NSData *)data
                                 completion:(MSGraphDriveItemUploadCompletionHandler)completionHandler
{
    MSURLSessionUploadTask *task = [self uploadTaskWithRequest:[self upload]
                                                      fromData:data
                                        odobjectWithDictionary:^(NSDictionary *response){
                                                return [[MSGraphDriveItem alloc] initWithDictionary:response];
                                        }
                                             completionHandler:completionHandler];
    [task execute];
    return task;

}

- (MSURLSessionUploadTask *) uploadFromFile:(NSURL *)fileURL
                                 completion:(MSGraphDriveItemUploadCompletionHandler)completionHandler
{
    MSURLSessionUploadTask *task = [self uploadTaskWithRequest:[self upload]
                                                      fromFile:fileURL
                                        odobjectWithDictionary:^(NSDictionary *response){
                                                return [[MSGraphDriveItem alloc] initWithDictionary:response];
                                        }
                                             completionHandler:completionHandler];
    [task execute];
    return task;
}

@end
