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
        [UIView animateWithDuration:1 animations:^{
            self.singleHeadCell.rotateImg.transform = CGAffineTransformRotate(self.singleHeadCell.rotateImg.transform, 1*M_PI);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                self.singleHeadCell.rotateImg.transform = CGAffineTransformRotate(self.singleHeadCell.rotateImg.transform, 1*M_PI);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1 animations:^{
                    self.singleHeadCell.rotateImg.transform = CGAffineTransformRotate(self.singleHeadCell.rotateImg.transform, 1*M_PI);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1 animations:^{
                        self.singleHeadCell.rotateImg.transform = CGAffineTransformRotate(self.singleHeadCell.rotateImg.transform, 1*M_PI);
                    }];
                }];
            }];
        }];
        
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            self.singleHeadCell.bigImg.top = 115 - ((avgScore/100.0) * 115);
            
            self.singleHeadCell.bigImg.left = 0;
        }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTSingleHeaderCell *cell = [MTSingleHeaderCell cell];
    self.singleHeadCell = cell;
    cell.precent = self.precent;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 145;
}

@end
