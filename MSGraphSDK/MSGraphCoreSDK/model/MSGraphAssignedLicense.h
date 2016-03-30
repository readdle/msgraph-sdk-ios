// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


#import "MSCollection.h"


#import "MSObject.h"
#import "MSCollection.h"

@interface MSGraphAssignedLicense : MSObject

	@property (nonatomic, setter=setDisabledPlans:, getter=disabledPlans) MSCollection* disabledPlans;
		@property (nonatomic, setter=setSkuId:, getter=skuId) NSString* skuId;
	
@end
