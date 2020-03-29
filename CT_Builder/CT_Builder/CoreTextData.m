//
//  CoreTextData.m
//  CT_Builder
//
//  Created by fly on 2020/3/29.
//  Copyright © 2020 JJWOW. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData
-(void)setCtFrame:(CTFrameRef)ctFrame{
    if (_ctFrame != ctFrame) {
        if (_ctFrame != nil) {
            CFRelease(_ctFrame);
        }
    }
    CFRetain(ctFrame);
    _ctFrame = ctFrame;
}

-(void)dealloc{
    if (_ctFrame != nil) {
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}
@end
