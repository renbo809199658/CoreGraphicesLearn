//
//  DrawView.h
//  CoreGraphicesLearn
//
//  Created by renmac on 2017/12/6.
//  Copyright © 2017年 renmac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DrawTypeLine,
    DrawTypeText,
    DrawTypePicture,
    DrawTypeAll,
}DrawType;


@interface DrawView : UIView


- (instancetype)initWithDrawType:(DrawType)type;

@end
