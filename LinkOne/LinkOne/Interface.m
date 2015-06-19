//
//  Interface.m
//  LinkOne
//
//  Created by 小伍 on 15-6-17.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "Interface.h"
#import "FirstViewController.h"
#import "XIBViewController.h"
@implementation Interface
- (void)setRootViewController:(UIViewController *)mainCon
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"title" message:@"打开链接库成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
    // 第一种 ,没有xib文件的
    FirstViewController *firstCon = [[FirstViewController alloc]init];
    
    
    //加上导航栏，并隐藏。
    UINavigationController *navCon = [[UINavigationController alloc]initWithRootViewController:firstCon];
    
    //转换传递过来的mainCon参数，实现界面跳转
    [mainCon presentViewController:navCon animated:YES completion:^{
        NSLog(@"跳转到动态更新模块成功!");
    }];

}

- (void)setXibRootViewController:(UIViewController *)mainCon andBundle:(NSBundle *)bundle
{
    // 第二种 , 有xib文件的
    XIBViewController *second = [[XIBViewController alloc]initWithNibName:@"XIBViewController" bundle:bundle];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:second];
    //转换传递过来的mainCon参数，实现界面跳转
    UIViewController *viewCon = (UIViewController *)mainCon;
    [viewCon presentViewController:nav animated:YES completion:^{
        NSLog(@"跳转到动态更新模块成功!");
    }];
    
}
@end
