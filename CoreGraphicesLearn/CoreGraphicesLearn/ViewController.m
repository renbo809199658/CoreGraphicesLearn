//
//  ViewController.m
//  CoreGraphicesLearn
//
//  Created by renmac on 2017/12/6.
//  Copyright © 2017年 renmac. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    DrawView *view = [[DrawView alloc]initWithDrawType:DrawTypeAll];
    view.frame = CGRectMake(0, 44, screenSize.width, 400);
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
