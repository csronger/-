//
//  CSRNewsTypeModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsTypeModel.h"

@implementation CSRNewsTypeModel


+ (NSDictionary *)objectClassInArray{
    return @{@"body" : [CSRNewsTypeBodyModel class]};
}
@end
@implementation CSRNewsTypeMetaModel

@end


@implementation CSRNewsTypeBodyModel

+ (NSDictionary *)objectClassInArray{
    return @{@"img" : [CSRNewsTypeDataImgModel class]};
}

@end


@implementation CSRNewsTypeDataLinkModel

@end


@implementation CSRNewsTypeDataImgModel

@end


@implementation CSRNewsTypeDataImgSizeModel

@end


