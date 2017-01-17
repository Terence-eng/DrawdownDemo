//
//  UIView+Category.m
//  DropdowBigDemo
//
//  Created by 陈伟鑫 on 2017/1/16.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)wx_x {
    return self.frame.origin.x;
}

- (void)setWx_x:(CGFloat)wx_x {
    CGRect frame = self.frame;
    frame.origin.x = wx_x;
    self.frame = frame;
}


- (CGFloat)wx_y {
    return self.frame.origin.y;
}

- (void)setWx_y:(CGFloat)wx_y {
    CGRect frame = self.frame;
    frame.origin.y = wx_y;
    self.frame = frame;
}

- (CGFloat)wx_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)wx_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (CGFloat)wx_width {
    return self.frame.size.width;
}

- (void)setWx_width:(CGFloat)wx_width {
    CGRect frame = self.frame;
    frame.size.width = wx_width;
    self.frame = frame;
}

- (CGFloat)wx_height {
    return self.frame.size.height;
}

- (void)setWx_height:(CGFloat)wx_height {
    CGRect frame = self.frame;
    frame.size.height = wx_height;
    self.frame = frame;
}

- (CGSize)wx_size {
    return self.frame.size;
}

- (void)setWx_size:(CGSize)wx_size {
    CGRect frame = self.frame;
    frame.size = wx_size;
    self.frame = frame;
}

- (CGFloat)wx_centerX {
    return self.center.x;
}

- (void)setWx_centerX:(CGFloat)wx_centerX {
    CGPoint center = self.center;
    center.x = wx_centerX;
    self.center = center;
}


- (CGFloat)wx_centerY {
    return self.center.y;
}

- (void)setWx_centerY:(CGFloat)wx_centerY {
    CGPoint center = self.center;
    center.y = wx_centerY;
    self.center = center;
}
@end
