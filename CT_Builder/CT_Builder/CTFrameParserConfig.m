//
//  CTFrameParserConfig.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig
-(instancetype)init{
    self = [super init];
    if (self) {
        _width = 200.f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = [UIColor colorWithRed:108/255.0 green:108/255.0 blue:108/255.0 alpha:1];
    }
    return self;
}
@end
