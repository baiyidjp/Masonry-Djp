//
//  BaseAnimatedViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/7.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "BaseAnimatedViewController.h"

@interface BaseAnimatedViewController ()
@property (nonatomic, strong) NSMutableArray *animatableConstraints;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) BOOL animating;
@end

@implementation BaseAnimatedViewController

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
    
    CGFloat padding = self.padding = 10;
    UIEdgeInsets paddInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    self.animatableConstraints = [NSMutableArray array];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
          make.edges.equalTo(self.view).insets(paddInsets).priorityLow(),
          make.bottom.mas_equalTo(blueView.mas_top).with.offset(-padding)
          ]];
        make.size.equalTo(redView);
        make.height.equalTo(blueView.mas_height);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
          make.edges.equalTo(self.view).insets(paddInsets).priorityLow(),
          make.left.mas_equalTo(greenView.mas_right).with.offset(padding),
          make.bottom.mas_equalTo(blueView.mas_top).with.offset(-padding)
          ]];
        make.size.equalTo(greenView);
        make.height.equalTo(blueView.mas_height);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
          make.edges.equalTo(self.view).insets(paddInsets).priorityLow(),
          ]];
        make.height.equalTo(greenView.mas_height);
        make.height.equalTo(redView.mas_height);
    }];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];

    [self.view layoutIfNeeded];
    [self updateConstraints:NO];
    
}

- (void)updateConstraints:(BOOL)isChange{
    
    CGFloat padding = isChange ? 100 : self.padding;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in self.animatableConstraints) {
        constraint.insets = paddingInsets;
    }
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //repeat!
        [self updateConstraints:!isChange];
    }];

}

@end
