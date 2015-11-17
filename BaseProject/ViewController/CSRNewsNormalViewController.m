//
//  CSRNewsNormalViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsNormalViewController.h"
#import "CSRNewsNormalCell.h"
#import "CSRNewsSlideImageCell.h"
#import "CSRNewsViewModel.h"
#import "CSRNewsHtmlViewController.h"

#import "iCarousel.h"

@interface CSRNewsNormalViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic, strong)CSRNewsViewModel *newsVM;
@end

@implementation CSRNewsNormalViewController

{//添加成员变量，因为不需要懒加载，所以不需要属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
/** 头部滚动视图 */
- (UIView *)headView
{
    [_timer invalidate];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    //添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.newsVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.newsVM titleForRowInIndexPic:0];
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    
    _ic.type = 8;
    //如果只有一张图，不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图，不可以滚动
    _ic.scrollEnabled = self.newsVM.indexPicNumber != 1;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    if (self.newsVM.indexPicNumber > 1)
    {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
- (CSRNewsViewModel *)newsVM {
    if(_newsVM == nil) {
        _newsVM = [[CSRNewsViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _newsVM;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[CSRNewsNormalCell class] forCellReuseIdentifier:@"NormalCell"];
    [self.tableView registerClass:[CSRNewsSlideImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM getDataFromNetCompleteHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headView];
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    [self.tableView.header beginRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.newsVM hasSlideForRow:indexPath.row])
    {
        CSRNewsSlideImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
        
        NSArray *images = [self.newsVM imagesForRow:indexPath.row];

        [cell.iconIV0.imageView setImageWithURL:images[0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:images[1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.imageView setImageWithURL:images[2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.commentsAllLb.text = [self.newsVM commentsAllForRow:indexPath.row];
        return cell;
    }
    CSRNewsNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
    cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
    cell.commentLb.text = [self.newsVM commentsAllForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.newsVM thumbNailForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return cell;
}
kRemoveCellSeparator

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.newsVM hasSlideForRow:indexPath.row]?120:100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CSRNewsHtmlViewController *vc = [[CSRNewsHtmlViewController alloc]initWithUrl:[self.newsVM commentsUrlForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.newsVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.newsVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}
//允许循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
//监控当前滚动到第几个
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    _titleLb.text = [self.newsVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    CSRNewsHtmlViewController *vc = [[CSRNewsHtmlViewController alloc]initWithUrl:[self.newsVM detailURLForRowInIndexPic:index]];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
