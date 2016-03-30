// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDrive()
{
    NSString* _driveType;
    MSGraphIdentitySet* _owner;
    MSGraphQuota* _quota;
    MSGraphDriveItemCollection* _items;
    MSGraphDriveItemCollection* _special;
    MSGraphDriveItem* _root;
}
@end

@implementation MSGraphDrive

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.drive";
    }
    return self;
}
- (NSString*) driveType
{
    return self.dictionary[@"driveType"];
}
- (void) setDriveType: (NSString*) val
{
    self.dictionary[@"driveType"] = val;
}
- (MSGraphIdentitySet*) owner
{
    if(!_owner){
        _owner = [[MSGraphIdentitySet alloc] initWithDictionary: self.dictionary[@"owner"] ];
    }
    return _owner;
}
- (void) setOwner: (MSGraphIdentitySet*) val
{
    _owner = val;
    self.dictionary[@"owner"] = val;
}
- (MSGraphQuota*) quota
{
    if(!_quota){
        _quota = [[MSGraphQuota alloc] initWithDictionary: self.dictionary[@"quota"] ];
    }
    return _quota;
}
- (void) setQuota: (MSGraphQuota*) val
{
    _quota = val;
    self.dictionary[@"quota"] = val;
}
- (MSGraphDriveItemCollection*) items
{
    if(!_items){
        
    NSMutableArray *itemsCollection = [NSMutableArray array];
    NSArray *itemss = self.dictionary[@"items"];

    if ([itemss isKindOfClass:[NSArray class]]){
        for (id items in itemss){
            [itemsCollection addObject:items];
         }
    }

    if ([itemsCollection count] > 0){
        _items = [[MSGraphDriveItemCollection alloc] initWithArray:itemsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _items;
}
- (void) setItems: (MSGraphDriveItemCollection*) val
{
    _items = val;
    self.dictionary[@"items"] = val;
}
- (MSGraphDriveItemCollection*) special
{
    if(!_special){
        
    NSMutableArray *specialCollection = [NSMutableArray array];
    NSArray *specials = self.dictionary[@"special"];

    if ([specials isKindOfClass:[NSArray class]]){
        for (id special in specials){
            [specialCollection addObject:special];
         }
    }

    if ([specialCollection count] > 0){
        _special = [[MSGraphDriveItemCollection alloc] initWithArray:specialCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _special;
}
- (void) setSpecial: (MSGraphDriveItemCollection*) val
{
    _special = val;
    self.dictionary[@"special"] = val;
}
- (MSGraphDriveItem*) root
{
    if(!_root){
        _root = [[MSGraphDriveItem alloc] initWithDictionary: self.dictionary[@"root"] ];
    }
    return _root;
}
- (void) setRoot: (MSGraphDriveItem*) val
{
    _root = val;
    self.dictionary[@"root"] = val;
}
- (MSGraphDriveItem*) items:(NSInteger)index
{
   MSGraphDriveItem* items = nil;
   if (self.items.value){
       items = self.items.value[index];
   }
   return items;
}
- (MSGraphDriveItem*) special:(NSInteger)index
{
   MSGraphDriveItem* special = nil;
   if (self.special.value){
       special = self.special.value[index];
   }
   return special;
}

@end
