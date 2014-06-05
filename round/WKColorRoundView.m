//
//  WKColorAnimationRectView.m
//  round
//
//  Created by Kohei Iwasaki on 2014/06/05.
//  Copyright (c) 2014年 Kohei Iwasaki. All rights reserved.
//

#import "WKColorRoundView.h"

// 度数法 -> ラジアン 変換マクロ
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

// ラインの幅の広さ
static const float kLineWidth = 40.0f;

// 色の開始位置（度数）
static const float kStartPosition = 270.0f;

// 色を変える間隔（度数）
static const float kColorDelta = 3.0f;

@implementation WKColorRoundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    double r = self.bounds.size.width /2;
    
    // ３部分に分けた円弧を描く。
    float deltaArc1 = 360.0f / 3.0f;
    
    for ( float r1 = _start ; r1 < _end ; r1 += deltaArc1 ){
        for ( float r2 = r1 ; r2 < r1 + deltaArc1 ; r2 += kColorDelta ){
            
            if(r2 > _end) break;
            
            if ( r1 < deltaArc1 * 1.0f ) {
                
                //　1部分目の色
                
                [[UIColor colorWithRed:(r2-r1)/deltaArc1
                                 green:0.0f
                                  blue:0.0f
                                 alpha:1.0
                  ] setStroke];
            } else if ( r1 < deltaArc1 * 2.0f ) {
                
                // 2部分目の色
                
                [[UIColor colorWithRed:0.0f
                                 green:(r2-r1)/deltaArc1
                                  blue:0.0f
                                 alpha:1.0
                  ] setStroke];
            } else {
                
                // 3部分目の色
                
                [[UIColor colorWithRed:0.0f
                                 green:0.0f
                                  blue:(r2-r1)/deltaArc1
                                 alpha:1.0
                  ] setStroke];
            }
            
            float pos = r2 + kStartPosition;
            if(pos > 360.0f) pos -= 360.0f;
            
            float rr = pos + kColorDelta + 1.0f;
            UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(r, r)
                                                                 radius:r - kLineWidth
                                                             startAngle:DEGREES_TO_RADIANS( pos )
                                                               endAngle:DEGREES_TO_RADIANS( rr )
                                                              clockwise:YES];
            [aPath setLineWidth:kLineWidth];
            [aPath stroke];
        }
    }
}

@end
