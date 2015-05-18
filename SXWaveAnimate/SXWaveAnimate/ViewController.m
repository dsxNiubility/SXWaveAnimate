//
//  ViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/5/17.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.tintColor = [UIColor orangeColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TableViewController *tbvc = (TableViewController *)segue.destinationViewController;
    tbvc.precent = [self.textView.text intValue];
}


@end
