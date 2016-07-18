//
//  MultipliedByViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "MultipliedByViewController.h"

@interface MultipliedByViewController ()

@end

@implementation MultipliedByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueView];
    
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *purpleView = [[UIView alloc]init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [greenView addSubview:purpleView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view).multipliedBy(0.9);
        make.height.mas_equalTo(self.view).multipliedBy(0.5).offset(-10);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(redView);
        make.width.mas_equalTo(redView.mas_width).multipliedBy(0.8);
        make.width.mas_equalTo(blueView.mas_height).multipliedBy(3);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(redView.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view).multipliedBy(0.9);
        make.height.mas_equalTo(self.view).multipliedBy(0.5).offset(-10);
    }];
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(greenView);
        make.height.mas_equalTo(greenView.mas_height).multipliedBy(0.8);
        make.width.mas_equalTo(purpleView.mas_height).multipliedBy(0.4);
    }];
}

@end
