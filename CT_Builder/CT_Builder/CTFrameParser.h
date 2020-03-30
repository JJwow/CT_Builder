//
//  CTFrameParser.h
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface CTFrameParser : NSObject

/**
 *  配置信息格式化
 *
 *  @param config 配置信息
 */
+(NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;

/**
 *  给内容设置配置信息
 *
 *  @param content 内容
 *  @param config  配置信息
 *
 */
+(CoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config;


/**
 *  给内容设置配置信息
 *
 *  @param path   模板文件路径
 *  @param config 配置信息
 *
 */
+(CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config;

@end

NS_ASSUME_NONNULL_END
