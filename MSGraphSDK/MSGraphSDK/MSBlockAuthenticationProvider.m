// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSBlockAuthenticationProvider.h"

@interface MSBlockAuthenticationProvider ()
@property (nonatomic, copy) MSAuthenticationBlock authBlock;
@end

@implementation MSBlockAuthenticationProvider

+ (MSBlockAuthenticationProvider*)providerWithBearerToken:(NSString *)token
{
    return [self providerWithBlock:^(NSMutableURLRequest *request, MSAuthenticationCompletion completion) {
        NSString * const header = [NSString stringWithFormat:@"Bearer %@", token];
        [request setValue:header forHTTPHeaderField:@"Authorization"];
        if (completion) {
            completion(request, nil);
        }
    }];
}

+ (MSBlockAuthenticationProvider*)providerWithBlock:(void (^)(NSMutableURLRequest *, void (^)(NSMutableURLRequest*, NSError*)))block
{
    NSParameterAssert(block);
    
    MSBlockAuthenticationProvider *provider = [[MSBlockAuthenticationProvider alloc] init];
    provider.authBlock = block;
    return provider;
}

- (void)appendAuthenticationHeaders:(NSMutableURLRequest *)request
                         completion:(void (^)(NSMutableURLRequest *, NSError *))completionHandler
{
    self.authBlock(request, completionHandler);
}

@end
