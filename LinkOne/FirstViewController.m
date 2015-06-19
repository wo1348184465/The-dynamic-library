//
//  FirstViewController.m
//  LinkOne
//
//  Created by 小伍 on 15-6-17.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * array;
}
@end

@implementation FirstViewController
- (void)buttonAction
{
    if ([self.navigationController.viewControllers count] >1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:button]];
    
    
    
    
    array = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 20; i ++) {
        [array addObject:[NSString stringWithFormat:@"   %d   ",i]];
        
    }
    
    
    
    UITableView * myTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTable.delegate= self;
    myTable .dataSource = self;
    [myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:myTable];
    
    
    
    // Do any additional setup after loading the view.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}


- (void)tableViewSelectIndex:(NSInteger)row
{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber * row = [NSNumber numberWithInteger:indexPath.row];
    
    
    // 动态库与主程序间通信
    [[NSNotificationCenter defaultCenter] postNotificationName:@"row" object:row];
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
