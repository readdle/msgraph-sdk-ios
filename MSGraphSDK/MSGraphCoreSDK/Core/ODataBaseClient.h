// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSHttpProvider.h"
#import "MSAuthenticationProvider.h"
#import "MSLoggerProtocol.h"
#import "PMSThrottlingCoordinator.h"

@interface ODataBaseClient : NSObject


@property NSURL *baseURL;

@property (strong) id<MSHttpProvider> httpProvider;

@property (strong) id<PMSThrottlingCoordinator> throttlingCoordinator;

@property (strong) id<PMSLogger> logger;

@property (strong) id<MSAuthenticationProvider> authenticationProvider;

-(instancetype)initWithURL:(NSString *)url httpProvider:(id<MSHttpProvider>)httpProvider authenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider;

@end
