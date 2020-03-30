//
//  CTDisplayView.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
#import "CoreTextImageData.h"
@implementation CTDisplayView

/*
 *CoreText是用于处理文字和字体的底层技术。它直接和Core Graphics(又被称为Quartz)打交道。Quartz是一个2D图形渲染引擎，能够处理OSX和iOS中图形显示问题。Quartz能够直接处理字体（font）和字形（glyphs），将文字渲染到界面上，它是基础库中唯一能够处理字形的模块。因此CoreText为了排版，需要将显示的文字内容、位置、字体、字形直接传递给Quartz。与其他UI组件相比，由于CoreText直接和Quartz来交互，所以它具有更高效的排版功能。
 *
 *实现了drawRect方法,系统也会为这个view申请一块内存区域，等待CoreGraphics可能的绘画操作。
 */

//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    //1、获取CG创建的上下文（上下文可以理解为画板）
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //2、设置字形变换矩阵为CGAffineTransformIdentity使上下文可以同时处理多个仿射变换
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    //反转画板坐标系，画板的坐标系默认坐标原点在左下角，和MAC OS相同
//    CGContextScaleCTM(context, 1.0, -1.0);
//    //移动画板位置，反转后Y轴=0位于下方出屏幕外self.bounds.size.height的位置
//    CGContextTranslateCTM(context, 0, -self.bounds.size.height);
//    //3、创建绘制区域
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    //4、设置绘制内容
//    NSAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:@"CoreText是用于处理文字和字体的底层技术。"
//    "它直接和Core Graphics(又被称为Quartz)打交道。"
//    "Quartz是一个2D图形渲染引擎，能够处理OSX和iOS中图形显示问题。"
//    "Quartz能够直接处理字体（font）和字形（glyphs），将文字渲染到界面上，它是基础库中唯一能够处理字形的模块。"
//    "因此CoreText为了排版，需要将显示的文字内容、位置、字体、字形直接传递给Quartz。"
//    "与其他UI组件相比，由于CoreText直接和Quartz来交互，所以它具有更高效的排版功能。"];
//    //5、创建CTFrame
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attString);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, NULL);
//    //6、开始绘制
//    CTFrameDraw(frame, context);
//    //7、释放资源，ref结尾的都是c语言中的对象不受ARC内存管理，需要手动释放
//    CFRelease(path);
//    CFRelease(framesetter);
//    CFRelease(frame);
//}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
 
    //1.获取当前绘图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.旋转坐坐标系(默认和UIKit坐标是相反的)
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
   //3.绘制内容
    if (self.data) {
        
        CTFrameDraw(self.data.ctFrame, context);
        for (CoreTextImageData *imageData in self.data.imageArray) {
            
            UIImage *image = [UIImage imageNamed:imageData.name];
            CGContextDrawImage(context, imageData.imagePostion, image.CGImage);
        }
    }
}

@end
