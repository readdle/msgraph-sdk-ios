// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSCollection.h"
#import "NSDate+MSSerialization.h"

@implementation MSCollection

-(instancetype)initWithArray:(NSArray *)array
                    nextLink:(NSString *)nextLink
              additionalData:(NSDictionary *)additionalData
{
    self = [super init];
    if (self){
        _value = array;
        _nextLink = [NSURL URLWithString:nextLink];
        _additionalData = additionalData;
    }
    return self;
}

- (NSArray *) arrayFromItem
{
    NSMutableArray *retArray = [NSMutableArray arrayWithCapacity:[self.value count]];
    [self.value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if ([obj respondsToSelector:@selector(dictionaryFromItem)]){
            retArray[idx] = [obj dictionaryFromItem];
        }
        else if ([obj respondsToSelector:@selector(arrayFromItem)]){
            retArray[idx] = [obj arrayFromItem];
        }
        else if ([obj respondsToSelector:@selector(ms_toString)]){
            retArray[idx] = [obj ms_toString];
        }
        else{
            retArray[idx] = obj;
        }
    }];
    return retArray;
}

@end
