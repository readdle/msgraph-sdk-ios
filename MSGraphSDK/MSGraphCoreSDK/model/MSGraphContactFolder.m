// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphContactFolder()
{
    NSString* _parentFolderId;
    NSString* _displayName;
    MSGraphContactCollection* _contacts;
    MSGraphContactFolderCollection* _childFolders;
}
@end

@implementation MSGraphContactFolder

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.contactFolder";
    }
    return self;
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (MSGraphContactCollection*) contacts
{
    if(!_contacts){
        
    NSMutableArray *contactsCollection = [NSMutableArray array];
    NSArray *contactss = self.dictionary[@"contacts"];

    if ([contactss isKindOfClass:[NSArray class]]){
        for (id contacts in contactss){
            [contactsCollection addObject:contacts];
         }
    }

    if ([contactsCollection count] > 0){
        _contacts = [[MSGraphContactCollection alloc] initWithArray:contactsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _contacts;
}
- (void) setContacts: (MSGraphContactCollection*) val
{
    _contacts = val;
    self.dictionary[@"contacts"] = val;
}
- (MSGraphContactFolderCollection*) childFolders
{
    if(!_childFolders){
        
    NSMutableArray *childFoldersCollection = [NSMutableArray array];
    NSArray *childFolderss = self.dictionary[@"childFolders"];

    if ([childFolderss isKindOfClass:[NSArray class]]){
        for (id childFolders in childFolderss){
            [childFoldersCollection addObject:childFolders];
         }
    }

    if ([childFoldersCollection count] > 0){
        _childFolders = [[MSGraphContactFolderCollection alloc] initWithArray:childFoldersCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _childFolders;
}
- (void) setChildFolders: (MSGraphContactFolderCollection*) val
{
    _childFolders = val;
    self.dictionary[@"childFolders"] = val;
}
- (MSGraphContact*) contacts:(NSInteger)index
{
   MSGraphContact* contacts = nil;
   if (self.contacts.value){
       contacts = self.contacts.value[index];
   }
   return contacts;
}
- (MSGraphContactFolder*) childFolders:(NSInteger)index
{
   MSGraphContactFolder* childFolders = nil;
   if (self.childFolders.value){
       childFolders = self.childFolders.value[index];
   }
   return childFolders;
}

@end
