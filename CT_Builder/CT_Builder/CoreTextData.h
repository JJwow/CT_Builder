//
//  CoreTextData.h
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
NS_ASSUME_NONNULL_BEGIN

@interface CoreTextData : NSObject
@property (assign,nonatomic)CTFrameRef ctFrame;
@property (assign,nonatomic)CGFloat height;
//新增加的成员
@property (strong,nonatomic)NSArray *imageArray;
@end

NS_ASSUME_NONNULL_END
