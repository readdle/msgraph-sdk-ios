// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphConversation()
{
    NSString* _topic;
    BOOL _hasAttachments;
    NSDate* _lastDeliveredDateTime;
    MSCollection* _uniqueSenders;
    NSString* _preview;
    MSGraphConversationThreadCollection* _threads;
}
@end

@implementation MSGraphConversation

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.conversation";
    }
    return self;
}
- (NSString*) topic
{
    return self.dictionary[@"topic"];
}
- (void) setTopic: (NSString*) val
{
    self.dictionary[@"topic"] = val;
}
- (BOOL) hasAttachments
{
    _hasAttachments = [self.dictionary[@"hasAttachments"] boolValue];
    return _hasAttachments;
}
- (void) setHasAttachments: (BOOL) val
{
    _hasAttachments = val;
    self.dictionary[@"hasAttachments"] = @(val);
}
- (NSDate*) lastDeliveredDateTime
{
    if(!_lastDeliveredDateTime){
        _lastDeliveredDateTime = [NSDate ms_dateFromString: self.dictionary[@"lastDeliveredDateTime"]];
    }
    return _lastDeliveredDateTime;
}
- (void) setLastDeliveredDateTime: (NSDate*) val
{
    _lastDeliveredDateTime = val;
    self.dictionary[@"lastDeliveredDateTime"] = val;
}
- (MSCollection*) uniqueSenders
{
    return self.dictionary[@"uniqueSenders"];
}
- (void) setUniqueSenders: (MSCollection*) val
{
    self.dictionary[@"uniqueSenders"] = val;
}
- (NSString*) preview
{
    return self.dictionary[@"preview"];
}
- (void) setPreview: (NSString*) val
{
    self.dictionary[@"preview"] = val;
}
- (MSGraphConversationThreadCollection*) threads
{
    if(!_threads){
        
    NSMutableArray *threadsCollection = [NSMutableArray array];
    NSArray *threadss = self.dictionary[@"threads"];

    if ([threadss isKindOfClass:[NSArray class]]){
        for (id threads in threadss){
            [threadsCollection addObject:threads];
         }
    }

    if ([threadsCollection count] > 0){
        _threads = [[MSGraphConversationThreadCollection alloc] initWithArray:threadsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _threads;
}
- (void) setThreads: (MSGraphConversationThreadCollection*) val
{
    _threads = val;
    self.dictionary[@"threads"] = val;
}
- (NSString*) uniqueSenders:(NSInteger)index
{
   NSString* uniqueSenders = nil;
   if (self.uniqueSenders.value){
       uniqueSenders = self.uniqueSenders.value[index];
   }
   return uniqueSenders;
}
- (MSGraphConversationThread*) threads:(NSInteger)index
{
   MSGraphConversationThread* threads = nil;
   if (self.threads.value){
       threads = self.threads.value[index];
   }
   return threads;
}

@end
