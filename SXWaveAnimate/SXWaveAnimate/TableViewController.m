//
//  TableViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/5/18.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "TableViewController.h"
#import "SXWaveCell.h"
#import "UIViewAdditions.h"

@interface TableViewController ()
@property(nonatomic,strong)SXWaveCell *waveCell;
@property(nonatomic,strong)SXWaveCell *waveCell2;
@property(nonatomic,strong)SXWaveCell *waveCell3;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d",self.precent);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self addAnimateWithCell:self.waveCell andType:0];
    [self addAnimateWithCell:self.waveCell2 andType:0];
    [self addAnimateWithCell:self.waveCell3 andType:2];

}

- (void)addAnimateWithCell:(SXWaveCell *)cell andType:(int)type
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
    
    if (type == 0) {
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            cell.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                cell.bigImg.top = -20;
            }
            
            cell.bigImg.left = 0;
        }];
    }else if (type == 1){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            cell.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                cell.bigImg.top = -20;
            }
            cell.bigImg.left = 0;
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:1.0 animations:^{
            cell.bigImg.top = 0;
            cell.bigImg.left = -200;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3.0 animations:^{
                cell.bigImg.top = 115 - ((avgScore/100.0) * 115);
                if (avgScore == 100) {
                    cell.bigImg.top = -20;
                }
                cell.bigImg.left = 0;
            }];
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SXWaveCell *cell = [SXWaveCell cell];
        self.waveCell = cell;
        cell.textColor = [UIColor orangeColor];
        cell.precent = self.precent;
        return cell;
    }else if (indexPath.row == 1){
        SXWaveCell *cell = [SXWaveCell cell];
        self.waveCell2 = cell;
        cell.textColor = [UIColor colorWithRed:28/255.0 green:125/255.0 blue:115/255.0 alpha:1];
        cell.alpha = 0.6;
        cell.precent = self.precent;
        return cell;
    }else if (indexPath.row == 2){
        SXWaveCell *cell = [SXWaveCell cell];
        self.waveCell3 = cell;
        cell.textColor = [UIColor whiteColor];
        cell.alpha = 0.3;
        cell.precent = self.precent;
        return cell;
    }
    else {
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 145;
}

@end
