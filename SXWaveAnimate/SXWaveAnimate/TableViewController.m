//
//  TableViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/5/18.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "TableViewController.h"
#import "MTSingleHeaderCell.h"
#import "UIViewAdditions.h"

@interface TableViewController ()
@property(nonatomic,strong)MTSingleHeaderCell *singleHeadCell;
@property(nonatomic,strong)MTSingleHeaderCell *singleHeadCell2;
@property(nonatomic,strong)MTSingleHeaderCell *singleHeadCell3;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d",self.precent);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self addAnimateWithCell:self.singleHeadCell andType:1];
    [self addAnimateWithCell:self.singleHeadCell2 andType:1];

}

- (void)addAnimateWithCell:(MTSingleHeaderCell *)cell andType:(int)type
{
    [UIView animateWithDuration:1 animations:^{
        cell.rotateImg.transform = CGAffineTransformRotate(cell.rotateImg.transform, 1*M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            cell.rotateImg.transform = CGAffineTransformRotate(cell.rotateImg.transform, 1*M_PI);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                cell.rotateImg.transform = CGAffineTransformRotate(cell.rotateImg.transform, 1*M_PI);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1 animations:^{
                    cell.rotateImg.transform = CGAffineTransformRotate(cell.rotateImg.transform, 1*M_PI);
                }];
            }];
        }];
    }];
    
    if (type == 1) {
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            cell.bigImg.top = 115 - ((avgScore/100.0) * 115);
            
            cell.bigImg.left = 0;
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            cell.bigImg.top = 115 - ((avgScore/100.0) * 115);
            
            cell.bigImg.left = 0;
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MTSingleHeaderCell *cell = [MTSingleHeaderCell cell];
        self.singleHeadCell = cell;
        cell.textColor = [UIColor orangeColor];
        cell.precent = self.precent;
        return cell;
    }else if (indexPath.row == 1){
        MTSingleHeaderCell *cell = [MTSingleHeaderCell cell];
        self.singleHeadCell2 = cell;
        cell.textColor = [UIColor colorWithRed:28/255.0 green:125/255.0 blue:115/255.0 alpha:1];
        cell.alpha = 0.5;
        cell.precent = self.precent;
        return cell;
    }else{
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 145;
}

@end
