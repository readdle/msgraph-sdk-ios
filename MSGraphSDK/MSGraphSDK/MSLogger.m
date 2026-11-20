// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSLogger.h"
#include <stdarg.h>

@implementation PMSLogger


- (instancetype)initWithLogLevel:(MSLogLevel)level
{
    self = [super init];
    if (self){
        _logLevel = level;
    }
    return self;
}

- (void)setLogLevel:(MSLogLevel)logLevel
{
    _logLevel = logLevel;
}

- (void)logWithLevel:(MSLogLevel)level format:(NSString *)format, ...
{
    if (level > self.logLevel
        || format == nil)
    {
        return;
    }

    va_list args;
    va_start(args, format);

    [self logWithLevel:level message:[[NSString alloc] initWithFormat:format arguments:args]];

    va_end(args);
}

- (void)logWithLevel:(MSLogLevel)level message:(NSString *)message
{
    if (level > self.logLevel) {
        return;
    }

    NSString *logLevel = nil;

    switch (level) {
        case MSLogLevelLogError:
            logLevel = @"ERROR :";
            break;
        case MSLogLevelLogWarn:
            logLevel = @"WARNING :";
            break;
        case MSLogLevelLogInfo:
            logLevel = @"INFO :";
            break;
        case MSLogLevelLogDebug:
            logLevel = @"DEBUG : ";
            break;
        case MSLogLevelLogVerbose:
            logLevel = @"VERBOSE :";
            break;
        default:
            break;
    }
    
    [self writeMessage:[NSString stringWithFormat:@"Graph SDK %@ %@", logLevel, message]];
}

- (void)writeMessage:(NSString *)message
{
    NSLog(@"%@", message);
}
@end
