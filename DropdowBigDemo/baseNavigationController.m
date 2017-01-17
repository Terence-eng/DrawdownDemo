//
//  baseNavigationController.m
//  DropdowBigDemo
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "baseNavigationController.h"

@interface baseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation baseNavigationController
+ (void)initialize {
    
}
- (void)viewDidLoad {
    
    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    
    id target = self.interactivePopGestureRecognizer.delegate;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}

@end
