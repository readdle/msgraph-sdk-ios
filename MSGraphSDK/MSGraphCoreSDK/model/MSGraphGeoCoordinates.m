// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphGeoCoordinates()
{
    CGFloat _altitude;
    CGFloat _latitude;
    CGFloat _longitude;
}
@end

@implementation MSGraphGeoCoordinates

- (CGFloat) altitude
{
    _altitude = [self.dictionary[@"altitude"] floatValue];
    return _altitude;
}
- (void) setAltitude: (CGFloat) val
{
    _altitude = val;
    self.dictionary[@"altitude"] = @(val);
}
- (CGFloat) latitude
{
    _latitude = [self.dictionary[@"latitude"] floatValue];
    return _latitude;
}
- (void) setLatitude: (CGFloat) val
{
    _latitude = val;
    self.dictionary[@"latitude"] = @(val);
}
- (CGFloat) longitude
{
    _longitude = [self.dictionary[@"longitude"] floatValue];
    return _longitude;
}
- (void) setLongitude: (CGFloat) val
{
    _longitude = val;
    self.dictionary[@"longitude"] = @(val);
}
@end
