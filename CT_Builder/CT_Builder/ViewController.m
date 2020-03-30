//
//  ViewController.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "UIView+Frame.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建画布
    CTDisplayView *dispaleView = [[CTDisplayView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    dispaleView.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    dispaleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dispaleView];
    
    //设置配置信息
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = dispaleView.width;
    

    //获取模板文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JsonTemplate" ofType:@"json"];
    
    
    //创建绘制数据实例
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    dispaleView.data = data;
    dispaleView.height = data.height;
    dispaleView.backgroundColor = [UIColor yellowColor];
}


@end
