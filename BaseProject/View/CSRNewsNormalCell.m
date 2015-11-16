//
//  CSRNewsNormalCell.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsNormalCell.h"

@implementation CSRNewsNormalCell

- (TRImageView *)iconIV
{
    if(_iconIV == nil)
    {
        _iconIV = [[TRImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)titleLb
{
    if(_titleLb == nil)
    {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = [UIColor blueColor];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = [UIFont systemFontOfSize:12];
        _commentLb.textColor = [UIColor lightGrayColor];
    }
    return _commentLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.commentLb];
        //图片 左10,宽高92,70,竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        //题目 距离图片右边缘8,右边缘10,上边缘笔图片上边缘矮3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
        //点击数,下边缘与图片对齐,右边缘与任意title对齐
        [self.commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
        }];
        
        
        
        UIView *yellowView = [UIView new];
        yellowView.backgroundColor = kRGBColor(254, 249, 236);
        self.selectedBackgroundView = yellowView;

    }
    return self;
}
@end
