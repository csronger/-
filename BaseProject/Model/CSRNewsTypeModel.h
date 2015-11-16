//
//  CSRNewsTypeModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CSRNewsTypeMetaModel,CSRNewsTypeBodyModel,CSRNewsTypeDataLinkModel,CSRNewsTypeDataImgModel,CSRNewsTypeDataImgSizeModel;
@interface CSRNewsTypeModel : BaseModel

@property (nonatomic, strong) CSRNewsTypeMetaModel *meta;

@property (nonatomic, strong) NSArray<CSRNewsTypeBodyModel *> *body;

@end
@interface CSRNewsTypeMetaModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger expiredTime;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger pageSize;

@end

@interface CSRNewsTypeBodyModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *commentsUrl;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, strong) CSRNewsTypeDataLinkModel *link;

@property (nonatomic, assign) NSInteger likes;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger cid;

@property (nonatomic, copy) NSString *shareTitle;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, strong) NSArray<CSRNewsTypeDataImgModel *> *img;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, assign) NSInteger commentsall;

@property (nonatomic, copy) NSString *staticImg;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *content;

@end

@interface CSRNewsTypeDataLinkModel : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@end

@interface CSRNewsTypeDataImgModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) CSRNewsTypeDataImgSizeModel *size;

@end

@interface CSRNewsTypeDataImgSizeModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *height;

@end

