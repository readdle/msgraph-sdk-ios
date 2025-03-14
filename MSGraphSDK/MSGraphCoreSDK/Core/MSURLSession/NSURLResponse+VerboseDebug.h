//
//  NSURLResponse+VerboseDebug.h
//  MSGraphSDK
//
//  Created by Zoreslav Khimich on 13.03.2025.
//  Copyright © 2025 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLResponse (VerboseDebug)

- (NSString *)verboseDebugDescriptionWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
