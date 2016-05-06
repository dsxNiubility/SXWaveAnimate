//
//  ViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/5/17.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXEnterPage.h"
#import "SXWaterCellDemoPage.h"
#import "SXWaterViewDemoPage.h"

@interface SXEnterPage ()
@property (weak, nonatomic) IBOutlet UITextView *txtView;

@end

@implementation SXEnterPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtView.layer.cornerRadius = 30;
    self.txtView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[SXWaterCellDemoPage class]]){
        SXWaterCellDemoPage *tbvc = (SXWaterCellDemoPage *)segue.destinationViewController;
        tbvc.precent = [self.txtView.text intValue];
    }else if ([segue.destinationViewController isKindOfClass:[SXWaterViewDemoPage class]]){
        SXWaterViewDemoPage *vc = (SXWaterViewDemoPage *)segue.destinationViewController;
        vc.precent = [self.txtView.text intValue];
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)pushClick {
    int number = [self.txtView.text intValue];
    if (number < 0 || number > 100) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"输入有误" message:@"请输入0~100的数字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"percent" sender:nil];
    }
}

- (IBAction)pushViewClick {
    int number = [self.txtView.text intValue];
    if (number < 0 || number > 100) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"输入有误" message:@"请输入0~100的数字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"percentView" sender:nil];
    }
}

@end
