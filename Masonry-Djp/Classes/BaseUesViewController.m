//
//  BaseUesViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "BaseUesViewController.h"

@interface BaseUesViewController ()

@end

@implementation BaseUesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    CGFloat padding = 10;
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).with.offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).with.offset(-padding);
        
        //设置三个控件等高
        make.height.mas_equalTo(@[redView,blueView]);
        //设置红 绿等宽
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).with.offset(padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(padding);
        make.right.bottom.mas_equalTo(-padding);
        make.top.mas_equalTo(greenView.mas_bottom).with.offset(padding);
    }];
    
}



@end
