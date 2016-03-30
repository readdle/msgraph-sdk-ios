// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDirectoryRole()
{
    NSString* _directoryRoleDescription;
    NSString* _displayName;
    NSString* _roleTemplateId;
    MSGraphDirectoryObjectCollection* _members;
}
@end

@implementation MSGraphDirectoryRole

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.directoryRole";
    }
    return self;
}
- (NSString*) directoryRoleDescription
{
    return self.dictionary[@"description"];
}
- (void) setDirectoryRoleDescription: (NSString*) val
{
    self.dictionary[@"description"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSString*) roleTemplateId
{
    return self.dictionary[@"roleTemplateId"];
}
- (void) setRoleTemplateId: (NSString*) val
{
    self.dictionary[@"roleTemplateId"] = val;
}
- (MSGraphDirectoryObjectCollection*) members
{
    if(!_members){
        
    NSMutableArray *membersCollection = [NSMutableArray array];
    NSArray *memberss = self.dictionary[@"members"];

    if ([memberss isKindOfClass:[NSArray class]]){
        for (id members in memberss){
            [membersCollection addObject:members];
         }
    }

    if ([membersCollection count] > 0){
        _members = [[MSGraphDirectoryObjectCollection alloc] initWithArray:membersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _members;
}
- (void) setMembers: (MSGraphDirectoryObjectCollection*) val
{
    _members = val;
    self.dictionary[@"members"] = val;
}
- (MSGraphDirectoryObject*) members:(NSInteger)index
{
   MSGraphDirectoryObject* members = nil;
   if (self.members.value){
       members = self.members.value[index];
   }
   return members;
}

@end
