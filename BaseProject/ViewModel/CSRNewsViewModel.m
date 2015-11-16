//
//  CSRNewsViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsViewModel.h"

@implementation CSRNewsViewModel

- (instancetype)initWithType:(InfoType)type
{
    if (self = [super init])
    {
        _type = type;
    }
    return self;
}

//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

//有几行
- (NSInteger)rowNumber
{
    return  self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [CSRNewsNetManager getNewsInfoWithType:self.type completionHandle:^(CSRNewsModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.item];
        completionHandle(error);
    }];
}


- (CSRNewsItemModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}
/** 返回某行的图片 */
- (NSURL *)thumbNailForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].thumbnail];
}
/** 返回某行的评论数 */
- (NSString *)commentsAllForRow:(NSInteger)row
{
    if ([self isNowForRow:row])
    {
        return [NSString stringWithFormat:@"直播中"];
    }
    return [NSString stringWithFormat:@"%@评论", [self modelForArr:self.dataArr row:row].commentsall];
}
/** 返回某行的标题 */
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}
/** 某行是否有hasSlide（三张图） */
- (BOOL)hasSlideForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"slide"];
}
/** 三张图地址 */
- (NSArray *)imagesForRow:(NSInteger)row
{
    NSArray *arr = [self modelForArr:self.dataArr row:row].style.images;
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < arr.count; i ++) {
        [array addObject:[NSURL URLWithString:arr[i]]];
    }
    return [array copy];
}

/** 是否是直播 */
- (BOOL)isNowForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"text_live"];
}
/** 点击某行后要跳转页面的url */
- (NSURL *)commentsUrlForRow:(NSInteger)row
{
    return  [NSURL URLWithString:[self modelForArr:self.dataArr row:row].commentsUrl];
}

@end
