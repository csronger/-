//
//  CSRNewsSlideImageCell.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface CSRNewsSlideImageCell : UITableViewCell

@property (nonatomic, strong)TRImageView *iconIV0;
@property (nonatomic, strong)TRImageView *iconIV1;
@property (nonatomic, strong)TRImageView *iconIV2;

@property (nonatomic, strong)UILabel *titleLb;
@property (nonatomic, strong)UILabel *commentsAllLb;


@end
