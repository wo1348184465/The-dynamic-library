//
//  XIBViewController.m
//  LinkOne
//
//  Created by 小伍 on 15-6-18.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "XIBViewController.h"

@interface XIBViewController ()
{
    
    IBOutlet UINavigationBar *nav;
    IBOutlet UIBarButtonItem *buttonBack;
}
@end

@implementation XIBViewController
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [button setBackgroundColor:[UIColor redColor]];
    
    [button setTitle:@"back" forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]init]];
    
    
    
//    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
