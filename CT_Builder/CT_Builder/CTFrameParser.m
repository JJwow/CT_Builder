//
//  CTFrameParser.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser
+(CoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config{
    //创建CTFrameStterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    //获得要绘制的区域的高度
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    //生成CTFrameRef实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHeight];
    
    //将生成好的CTFrameRef实例和计算好的绘制高度保存到CoreTextData实例中，最后返回CoreTextData实例
    CoreTextData *data = [[CoreTextData alloc] init];
    data.ctFrame = frame;
    data.height = textHeight;
    
    //释放内存
    CFRelease(framesetter);
    CFRelease(frame);
    
    return data;
}

//配置信息格式化
+(NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config{
    
    CGFloat fontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpcing = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        //行距调整
        {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpcing},
        //最大行距
        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpcing},
        //最小行距
        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpcing},
    };
    
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    UIColor *textColor = config.textColor;
   
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(fontRef);
    CFRelease(theParagraphRef);
    return dict;
}

//创建CTFrameRef绘制路径实例
+(CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter config:(CTFrameParserConfig *)config height:(CGFloat)height{
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.width, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}
@end
