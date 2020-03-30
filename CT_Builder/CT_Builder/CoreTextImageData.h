//
//  CoreTextImageData.h
//  CT_Builder
//
//  Created by 王俊杰 on 2020/3/30.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CoreTextImageData : NSObject
//图片资源名称
@property (copy,nonatomic)NSString *name;
//图片位置的起始点
@property (assign,nonatomic)CGFloat position;
//图片的尺寸
@property (assign,nonatomic)CGRect imagePostion;
@end

NS_ASSUME_NONNULL_END
