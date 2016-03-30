// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphUploadSession()
{
    NSString* _uploadUrl;
    NSDate* _expirationDateTime;
    MSCollection* _nextExpectedRanges;
}
@end

@implementation MSGraphUploadSession

- (NSString*) uploadUrl
{
    return self.dictionary[@"uploadUrl"];
}
- (void) setUploadUrl: (NSString*) val
{
    self.dictionary[@"uploadUrl"] = val;
}
- (NSDate*) expirationDateTime
{
    if(!_expirationDateTime){
        _expirationDateTime = [NSDate ms_dateFromString: self.dictionary[@"expirationDateTime"]];
    }
    return _expirationDateTime;
}
- (void) setExpirationDateTime: (NSDate*) val
{
    _expirationDateTime = val;
    self.dictionary[@"expirationDateTime"] = val;
}
- (MSCollection*) nextExpectedRanges
{
    return self.dictionary[@"nextExpectedRanges"];
}
- (void) setNextExpectedRanges: (MSCollection*) val
{
    self.dictionary[@"nextExpectedRanges"] = val;
}
@end
