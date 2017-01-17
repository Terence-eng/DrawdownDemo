//
//  UIView+Category.h
//  DropdowBigDemo
//
//  Created by 陈伟鑫 on 2017/1/16.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)


@property (nonatomic, assign) CGFloat wx_x;

@property (nonatomic, assign) CGFloat wx_y;

@property (nonatomic, readonly) CGFloat wx_right;

@property (nonatomic, readonly) CGFloat wx_bottom;

@property (nonatomic, assign) CGFloat wx_width;

@property (nonatomic, assign) CGFloat wx_height;

@property (nonatomic, assign) CGSize wx_size;

@property (nonatomic, assign) CGFloat wx_centerX;

@property (nonatomic, assign) CGFloat wx_centerY;
@end
