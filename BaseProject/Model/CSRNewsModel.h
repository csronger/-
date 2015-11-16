//
//  CSRNewsModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CSRNewsModel,CSRNewsItemModel,CSRNewsItemLinkModel,CSRNewsItemLiveExtModel,CSRNewsItemStyleModel;

@interface CSRNewsModel : BaseModel

@property (nonatomic, strong) NSArray<CSRNewsItemModel *> *item;

@property (nonatomic, assign) NSInteger expiredTime;

@property (nonatomic, copy) NSString *listId;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger totalPage;

@end


@interface CSRNewsItemModel : NSObject

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *online;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *styleType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) CSRNewsItemLinkModel *link;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *documentId;

@property (nonatomic, strong) CSRNewsItemLiveExtModel *liveExt;

@property (nonatomic, strong)NSString *comments;

@property (nonatomic, strong)NSString *commentsall;

@property (nonatomic, strong)NSString *commentsUrl;

@property (nonatomic, assign)BOOL hasVideo;

@property (nonatomic, strong)NSString *source;

@property (nonatomic, strong)NSString *updateTime;

@property (nonatomic, assign)BOOL hasSlide;

@property (nonatomic, strong)CSRNewsItemStyleModel *style;

@end

@interface CSRNewsItemLinkModel : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@end

@interface CSRNewsItemLiveExtModel : NSObject

@property (nonatomic, copy) NSString *status;

@end


@interface CSRNewsItemStyleModel : NSObject

@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSString *slides;

@end
