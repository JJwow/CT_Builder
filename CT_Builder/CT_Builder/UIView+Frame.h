//
//  UIView+Frame.h
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

-(CGFloat)x;
-(void)setX:(CGFloat)x;

-(CGFloat)y;
-(void)setY:(CGFloat)y;

-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
