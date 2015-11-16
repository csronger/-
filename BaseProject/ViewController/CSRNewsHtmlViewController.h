//
//  CSRNewsHtmlViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSRNewsHtmlViewController : UIViewController
- (id)initWithUrl:(NSURL *)url;
@property (nonatomic, strong)NSURL *url;
@end
