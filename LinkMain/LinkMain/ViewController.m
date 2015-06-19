//
//  ViewController.m
//  LinkMain
//
//  Created by 小伍 on 15-6-17.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <dlfcn.h>
#define SBSERVPATH  "/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *openLinkOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [openLinkOne setFrame:CGRectMake(100, 100, 100, 100)];
    [openLinkOne setBackgroundColor:[UIColor redColor]];
    [openLinkOne setTitle:@"LinkOne" forState:UIControlStateNormal];
    [openLinkOne addTarget:self action:@selector(openLinkOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openLinkOne];
    
    

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setIndexRow:) name:@"row"object:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)openLinkOne
{
    // 第一种: 使用dlopen加载动态库的形式　使用此种方法的时候注意头文件的引入
//    [self dlopenLink];
    
    // 第二种:使用NSBundle加载动态库
    [self nsBundleLink];
    
}
- (void)dlopenLink
{
    NSString *path = [NSString stringWithFormat:@"%@/Documents/LinkOne.framework/LinkOne",NSHomeDirectory()];
    NSLog(@"🐱🐱🐱🐱🐱%@",path);
    void * libHandle = dlopen([path cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
    if (libHandle == NULL) {
        char *error = dlerror();
        NSLog(@"dlopen error: %s", error);
    }
    else
    {
        NSLog(@"dlopen load framework success.");
        
        Class rootViewController = NSClassFromString(@"Interface");
        if (rootViewController)
        {
            NSObject * objcet = [rootViewController new];
            [objcet performSelector:@selector(setRootViewController:) withObject:self];
        }
    }
}

- (void)nsBundleLink
{
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSString * path = [NSString stringWithFormat:@"%@/%@",paths,@"LinkOne.framework"];
    NSLog(@"🐶🐶🐶%@",path);
    NSBundle * frameBundle = [NSBundle bundleWithPath:path];
    if (frameBundle && [frameBundle load]) {
        NSLog(@"成功加载动态库");
        Class linkOne = NSClassFromString(@"Interface");
        if (linkOne) {
            NSObject * object = [linkOne alloc];
            [object performSelector:@selector(setXibRootViewController:andBundle:) withObject:self withObject:frameBundle];
        }
        
        
    }
}


- (void)setIndexRow:(NSNotification *)obj
{
    NSInteger row = [obj.object integerValue];
    NSLog(@"🐱🐱🐱 = %ld",row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
