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

@interface CSRNewsNormalViewController ()
@property (nonatomic, strong)CSRNewsViewModel *newsVM;
@end

@implementation CSRNewsNormalViewController

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
            [self.tableView.header endRefreshing];
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
