//
//  DrawView.m
//  gitTest
//
//  Created by Binbin Mu on 2018/5/23.
//  Copyright © 2018年 Binbin Mu. All rights reserved.
//

#import "DrawView.h"
@interface DrawView()
@property(nonatomic ,assign)CGFloat offsetX;
@property(nonatomic ,strong)CAShapeLayer *shapLayer;
@end

@implementation DrawView

-(void)drawRect:(CGRect)rect
{
    self.offsetX += 3;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, rect.size.width/2);
    for ( int i = 0; i < rect.size.width; i++) {
        CGFloat y = 20*sin(2.5*M_PI/rect.size.width *i - self.offsetX * M_PI/180) + 50;
        CGPathAddLineToPoint(path, nil, i, y);
    }
    CGPathAddLineToPoint(path, nil,  rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    
    self.shapLayer.fillColor = [UIColor greenColor].CGColor;
    _shapLayer.path = path;
    CGPathRelease(path);
    
    [self.layer addSublayer:_shapLayer];
}

-(CAShapeLayer *)shapLayer
{
    if (_shapLayer == nil) {
        _shapLayer = [CAShapeLayer layer];
    }
    return _shapLayer;
}


@end
