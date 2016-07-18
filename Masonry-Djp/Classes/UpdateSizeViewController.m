//
//  UpdateSizeViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "UpdateSizeViewController.h"

@interface UpdateSizeViewController ()
@property(nonatomic,strong)UIButton *growingButton;
@property(nonatomic,assign)CGFloat scacle;
@end

@implementation UpdateSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"点我放大" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
    self.scacle = 1.0;
}

//更新约束的方法
- (void)updateViewConstraints{
    
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        //设置宽高 默认为100  并且优先级最低
        make.width.height.mas_equalTo(100 *self.scacle).priorityLow();
        //设置宽高的最大值不超过屏幕 (只有设置了优先级最低才可以)
        make.width.height.lessThanOrEqualTo(self.view);
    }];
    [super updateViewConstraints];
}

- (void)onGrowButtonTaped:(UIButton *)button{
    
    self.scacle += 0.2;
    
    //高度某个view需要更新约束
    [self.view setNeedsUpdateConstraints];
    //检测这个view是否有约束需要更新 如果有在调用下面的方法 更新约束
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
