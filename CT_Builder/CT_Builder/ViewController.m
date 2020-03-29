//
//  ViewController.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CTDisplayView *v = [[CTDisplayView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 200)];
    v.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v];
}


@end
