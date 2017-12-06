//
//  DrawView.m
//  CoreGraphicesLearn
//
//  Created by renmac on 2017/12/6.
//  Copyright © 2017年 renmac. All rights reserved.
//

#import "DrawView.h"
@interface DrawView ()

@property (nonatomic, assign)DrawType type;

@end

@implementation DrawView

- (instancetype)initWithDrawType:(DrawType)type{
    if ( self = [super init]) {
        self.type = type;
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return  self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 3.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, UIColor.greenColor.CGColor);
        //        CGContextFillPath(ctx);
    
    if (self.type == DrawTypeLine || _type == DrawTypeAll) {
        CGContextMoveToPoint(ctx, 20, 20);
        CGContextAddLineToPoint(ctx, 100, 100);
        CGContextAddLineToPoint(ctx, 20, 180);
        CGContextAddLineToPoint(ctx, 20, 20);
    }
    //关于绘制Text在7以后交给CoreText框架了
    if (_type == DrawTypeText || _type == DrawTypeAll) {
        // 使用UIKit框架
        NSString *text = @"this is a drawed string";
        UIFont *font = [UIFont systemFontOfSize:18];
        CGRect textReact;
        textReact.size = [text sizeWithFont:font];
        textReact.origin.x = 180;
        textReact.origin.y = 30;
        [text drawInRect:textReact withFont:font];
        //使用纯CoreGraphices框架
        char *name = "this is another derawd string";
        CGContextSetFont(ctx, (__bridge CGFontRef)[UIFont systemFontOfSize:18]);
        CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
        CGContextShowTextAtPoint(ctx,180,100, name,strlen(name));
    }
    if (_type == DrawTypePicture || _type == DrawTypeAll){
        UIImage *img = [UIImage imageNamed:@"computer"];
        //UIKit 框架
//        [img drawAtPoint:CGPointMake(100, 200)];
        // CoreGraphices框架
        img =  UIGraphicsGetImageFromCurrentImageContext();
        CGContextTranslateCTM(ctx,0.0f,self.frame.size.height);
        CGContextScaleCTM(ctx, 1.0, -1.0);
        CGContextDrawImage(ctx,CGRectMake(100,200, img.size.width, img.size.height), [img CGImage]);
        
        
    }
    CGContextStrokePath(ctx);
}


@end
