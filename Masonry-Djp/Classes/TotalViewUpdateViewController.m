//
//  TotalViewUpdateViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "TotalViewUpdateViewController.h"

@interface TotalViewUpdateViewController ()
@property(nonatomic,assign)BOOL isBig;
@property(nonatomic,strong)UIView *blueView;
@property(nonatomic,strong)UIView *redView;
@end

@implementation TotalViewUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.blueView = [[UIView alloc]init];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.redView = [[UIView alloc]init];
    self.redView.backgroundColor = [UIColor redColor];
    [self.blueView addSubview:self.redView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    self.blueView.userInteractionEnabled = YES;
    [self.blueView addGestureRecognizer:tap];
}

- (void)tapView{
    
    self.isBig = !self.isBig;
    //告诉view需要更新约束
    [self.view setNeedsUpdateConstraints];
    //是否有更新约束
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)updateViewConstraints{
        
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        if (self.isBig) {
            make.width.height.mas_equalTo(self.view.frame.size.width-20);
        }else{
            make.width.height.mas_equalTo(self.view.frame.size.width/2-20);
        }
        
    }];
    
    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.blueView);
        if (self.isBig) {
            make.width.height.mas_equalTo(355).priorityLow();
        }else{
            make.width.height.mas_equalTo(50).priorityLow();
        }
        make.width.height.lessThanOrEqualTo(@250);
        make.width.height.greaterThanOrEqualTo(@100);
    }];
    
    [super updateViewConstraints];
}

@end
