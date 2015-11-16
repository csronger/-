//
//  CSRNewsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsViewController.h"
#import "CSRNewsNormalViewController.h"

@interface CSRNewsViewController ()

@end

@implementation CSRNewsViewController

+ (UINavigationController *)standardCSRNewsNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CSRNewsViewController *vc = [[CSRNewsViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return [arr copy];
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"InfoType"];
    }
    return [arr copy];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"最新资讯";
    [Factory addMenuItemToVC:self];
}

+ (NSArray *)itemNames
{
    return @[@"头条", @"娱乐", @"历史", @"科技", @"文化"];
}
+ (NSArray *)viewControllerClasses
{
    NSMutableArray *arr = [NSMutableArray new];
    DDLogVerbose(@"%ld", [self itemNames].count);
    for (id obj in [self itemNames])
    {
        [arr addObject:[CSRNewsNormalViewController class]];
    }
    return [arr copy];
}
@end
