//
//  CSRNewsSlideImageCell.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsSlideImageCell.h"

@implementation CSRNewsSlideImageCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = [UIColor blueColor];
        _titleLb.numberOfLines = 1;
    }
    return _titleLb;
}
- (TRImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[TRImageView alloc] init];
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
    }
    return _iconIV2;
}

- (UILabel *)commentsAllLb {
    if(_commentsAllLb == nil) {
        _commentsAllLb = [[UILabel alloc] init];
        _commentsAllLb.font = [UIFont systemFontOfSize:12];
        _commentsAllLb.textColor = [UIColor lightGrayColor];
    }
    return _commentsAllLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        [self.contentView addSubview:self.commentsAllLb];
        //左右10 上下3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(_commentsAllLb.mas_left).mas_equalTo(-10);
            make.top.mas_equalTo(5);
        }];
        [self.commentsAllLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(70);
            make.width.mas_greaterThanOrEqualTo(40);
        }];
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
            make.bottom.mas_equalTo(-5);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.topMargin.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-5);
        }];
        
        UIView *yellowView = [UIView new];
        yellowView.backgroundColor = kRGBColor(254, 249, 236);
        self.selectedBackgroundView = yellowView;
    }
    return self;
}

@end
