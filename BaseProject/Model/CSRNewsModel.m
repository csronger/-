//
//  CSRNewsModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsModel.h"

@implementation CSRNewsModel
+ (NSDictionary *)objectClassInArray
{
    return @{@"item":[CSRNewsItemModel class]};
}
@end

@implementation CSRNewsItemModel

@end

@implementation CSRNewsItemLinkModel

@end

@implementation CSRNewsItemLiveExtModel

@end

@implementation CSRNewsItemStyleModel

@end