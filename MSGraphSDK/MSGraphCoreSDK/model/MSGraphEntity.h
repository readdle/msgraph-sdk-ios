// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSObject.h"
#import "MSCollection.h"

@interface MSGraphEntity : MSObject

  @property (nonatomic, setter=setODataType:, getter=oDataType) NSString *oDataType;
  @property (nonatomic, setter=setEntityId:, getter=entityId) NSString* entityId;
  
@end
