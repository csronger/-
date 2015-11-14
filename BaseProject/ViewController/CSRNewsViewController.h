//
//  CSRNewsViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"

@interface CSRNewsViewController : WMPageController
//内容页应该是单例的
+ (UINavigationController *)standardCSRNewsNavi;
@end
