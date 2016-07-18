//
//  RemakeUpdateViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "RemakeUpdateViewController.h"

@interface RemakeUpdateViewController ()
@property(nonatomic,strong)UIButton *growingButton;
@property(nonatomic,assign)BOOL isExpand;//是否展开
@end

@implementation RemakeUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
}

- (void)updateViewConstraints{
    
    __weak typeof(self) weakSelf = self;
//    [self.growingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        if (weakSelf.isExpand) {
            make.bottom.mas_equalTo(-10);
        }else{
            make.bottom.mas_equalTo(-self.view.frame.size.height/2-10);
        }
    }];
    
    [super updateViewConstraints];
} 

- (void)onGrowButtonTaped:(UIButton *)button{
    
    self.isExpand = !self.isExpand;
    if (self.isExpand) {
        [self.growingButton setTitle:@"点我关闭" forState:UIControlStateNormal];
    }else{
        [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    }
    //高度某个view需要更新约束
    [self.view setNeedsUpdateConstraints];
    //检测这个view是否有约束需要更新 如果有在调用下面的方法 更新约束
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
