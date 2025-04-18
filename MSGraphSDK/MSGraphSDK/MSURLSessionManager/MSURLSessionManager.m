// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionManager.h"
#import "MSNSURLSessionTaskDelegate.h"

@interface MSURLSessionManager()

@property (strong, nonatomic) NSURLSessionConfiguration *urlSessionConfiguration;

@property (strong, nonatomic) NSURLSession *urlSession;

@property (strong, nonatomic) NSMutableDictionary *taskDelegates;

@end

@implementation MSURLSessionManager

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)urlSessionConfiguration
{
    self = [super init];
    if (self){
        _urlSessionConfiguration = urlSessionConfiguration;
        _urlSession = [NSURLSession sessionWithConfiguration:urlSessionConfiguration delegate:self delegateQueue:nil];
        _taskDelegates = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(MSDataCompletionHandler)completionHandler;
{
    NSURLSessionDataTask *dataTask = nil;
    @synchronized(self.urlSession){
        dataTask = [self.urlSession dataTaskWithRequest:request];
    }
    
    [self addDelegateForTask:dataTask withProgress:nil completion:completionHandler];
    return dataTask;
}

- (NSURLSessionDownloadTask *) downloadTaskWithRequest:(NSURLRequest *)request
                                              progress:(NSProgress * __autoreleasing *)progress
                                     completionHandler:(MSRawDownloadCompletionHandler)completionHandler
{
    return [self downloadTaskWithRequest:request
                                progress:progress
                  skipHeadersInheritance:NO
                       completionHandler:completionHandler];
}

- (NSURLSessionDownloadTask *) downloadTaskWithRequest:(NSURLRequest *)request
                                              progress:(NSProgress * __autoreleasing *)progress
                                skipHeadersInheritance:(BOOL)skipHeadersInheritance
                                     completionHandler:(MSRawDownloadCompletionHandler)completionHandler
{
    NSURLSessionDownloadTask *downloadTask = nil;
    @synchronized(self.urlSession){
        downloadTask = [self.urlSession downloadTaskWithRequest:request];
    }
    
    [self addDelegateForTask:downloadTask withProgress:progress skipHeadersInheritance:skipHeadersInheritance completion:completionHandler];
    
    return downloadTask;
}

- (NSURLSessionUploadTask *)uploadTaskWithRequest:(NSURLRequest *)request
                                         fromData:(NSData *)data
                                         progress:(NSProgress * __autoreleasing *)progress
                                completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler
{
    NSURLSessionUploadTask *uploadTask = nil;
    @synchronized(self.urlSession){
        uploadTask = [self.urlSession uploadTaskWithRequest:request fromData:data];
    }
    [self addDelegateForTask:uploadTask withProgress:progress completion:completionHandler];
    
    return uploadTask;
}

- (NSURLSessionUploadTask *)uploadTaskWithRequest:(NSURLRequest *)request
                                         fromFile:(NSURL *)fileURL
                                         progress:(NSProgress * __autoreleasing *)progress
                                completionHandler:(MSRawUploadCompletionHandler)completionHandler
{
    NSURLSessionUploadTask *uploadTask = nil;
    @synchronized(self.urlSession){
        uploadTask = [self.urlSession uploadTaskWithRequest:request fromFile:fileURL];
    }
    
    [self addDelegateForTask:uploadTask withProgress:progress completion:completionHandler];
    
    return uploadTask;
}

- (void)addDelegateForTask:(NSURLSessionTask *)task
              withProgress:(NSProgress * __autoreleasing *)progress
                completion:(MSURLSessionTaskCompletion)completion
{
    [self addDelegateForTask:task
                withProgress:progress
      skipHeadersInheritance:NO
                  completion:completion];
}

- (void)addDelegateForTask:(NSURLSessionTask *)task
              withProgress:(NSProgress * __autoreleasing *)progress
    skipHeadersInheritance:(BOOL)skipHeadersInheritance
                completion:(MSURLSessionTaskCompletion)completion
{
    MSURLSessionTaskDelegate *delegate = [[MSURLSessionTaskDelegate alloc]
                                          initWithProgressRef:progress
                                          skipHeadersInheritance:skipHeadersInheritance
                                          completion:completion];
    @synchronized(self.taskDelegates){
        self.taskDelegates[@(task.taskIdentifier)] = delegate;
    }
}

- (MSURLSessionTaskDelegate*)getDelegateForTask:(NSURLSessionTask *)task
{
    MSURLSessionTaskDelegate *delegate = nil;
    @synchronized(self.taskDelegates){
        delegate = self.taskDelegates[@(task.taskIdentifier)];
    }
    return delegate;
}

- (void)removeTaskDelegateForTask:(NSURLSessionTask *)task
{
    @synchronized(self.taskDelegates){
        [self.taskDelegates removeObjectForKey:@(task.taskIdentifier)];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:task];
    
    if (delegate){
        [delegate task:task didCompleteWithError:error];
    }
    [self removeTaskDelegateForTask:task];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
                                     didReceiveData:(NSData *)data
{
    MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:dataTask];
    
    if (delegate){
        [delegate didReceiveData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                                didSendBodyData:(int64_t)bytesSent
                                 totalBytesSent:(int64_t)totalBytesSent
                       totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:task];
    
    if (delegate){
        [delegate updateProgressWithBytesSent:totalBytesSent expectedBytes:totalBytesExpectedToSend];
    }
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                           didWriteData:(int64_t)bytesWritten
                                      totalBytesWritten:(int64_t)totalBytesWritten
                              totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:downloadTask];
    
    if (delegate){
        [delegate updateProgressWithBytesSent:totalBytesWritten expectedBytes:totalBytesExpectedToWrite];
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:downloadTask];
    
    if (delegate) {
        [delegate task:downloadTask didCompleteDownload:location];
        [delegate task:downloadTask didCompleteWithError:nil];
        // remove the task now so we don't call the completion handler when the completion delegate method gets called
        [self removeTaskDelegateForTask:downloadTask];
    }
}

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
willPerformHTTPRedirection:(NSHTTPURLResponse *)redirectResponse
        newRequest:(NSURLRequest *)request
 completionHandler:(void (^)(NSURLRequest *))completionHandler
{
    NSMutableURLRequest *newRequest = nil;
    if (request) {
        newRequest = [request mutableCopy];
        
        // https://readdle-j.atlassian.net/browse/EXP-13297
        // fkavun
        // Needs this check to avoid adding authentication header to the new request
        // The newRequest in this case is download URL and according to documentation it shouldn't use authentication header
        // Sometimes using authentication header causes 401 errors
        // https://learn.microsoft.com/en-us/graph/api/driveitem-get-content?view=graph-rest-1.0&tabs=http#response
        MSURLSessionTaskDelegate *delegate = [self getDelegateForTask:task];
        if (delegate.skipHeadersInheritance) {
            completionHandler(newRequest);
            return;
        }
        
        [task.originalRequest.allHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            [newRequest setValue:value forHTTPHeaderField:key];
        }];
    }
    completionHandler(newRequest);
}

@end
