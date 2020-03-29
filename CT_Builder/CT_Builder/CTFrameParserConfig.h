//
//  CTFrameParserConfig.h
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CTFrameParserConfig : NSObject

//配置属性
@property (nonatomic ,assign)CGFloat width;
@property (nonatomic, assign)CGFloat fontSize;
@property (nonatomic, assign)CGFloat lineSpace;
@property (nonatomic, strong)UIColor *textColor;

@end

NS_ASSUME_NONNULL_END
