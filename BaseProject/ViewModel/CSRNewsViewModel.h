//
//  CSRNewsViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CSRNewsNetManager.h"
@interface CSRNewsViewModel : BaseViewModel


/** 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithType:(InfoType)type;
@property(nonatomic) InfoType type;

//有几行
@property (nonatomic, assign)NSInteger rowNumber;

/** 返回某行的图片 */
- (NSURL *)thumbNailForRow:(NSInteger)row;
/** 返回某行的评论数 */
- (NSString *)commentsAllForRow:(NSInteger)row;
/** 返回某行的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行是否有hasSlide（三张图） */
- (BOOL)hasSlideForRow:(NSInteger)row;
/** 三张图地址 */
- (NSArray *)imagesForRow:(NSInteger)row;

/** 是否是直播 */
- (BOOL)isNowForRow:(NSInteger)row;
/** 点击某行后要跳转页面的url */
- (NSURL *)commentsUrlForRow:(NSInteger)row;

//头部滚动视图
@property (nonatomic, strong)NSMutableArray *newsArr;
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property(nonatomic) NSInteger indexPicNumber;
/** 获取展示栏中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

@property (nonatomic, strong)CSRNewsModel *allModel;
@end
