//
//  TriangleUIView.m
//  CPTempCalculator
//
//  Created by Christine Wang on 1/20/14.
//  Copyright (c) 2014 Christine Wang. All rights reserved.
//

#import "TriangleUIView.h"

@implementation TriangleUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 -(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);

    CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextClosePath(ctx);
 
    // TODO: update init to allow fill to be passed in
    CGContextSetFillColorWithColor(ctx, [UIColor lightGrayColor].CGColor);

    CGContextFillPath(ctx);
}

@end