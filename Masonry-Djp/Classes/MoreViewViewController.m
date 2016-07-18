//
//  MoreViewViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "MoreViewViewController.h"

@interface MoreViewViewController ()
@property(nonatomic,strong)NSMutableArray *viewArray;
@property(nonatomic,assign)BOOL isFirst;
@end

@implementation MoreViewViewController

- (NSMutableArray *)viewArray{
    
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    for (int i = 0; i < 8; i++) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [self returnColor];
        view.layer.borderColor = [UIColor yellowColor].CGColor;
        view.layer.borderWidth = 2;
        [self.view addSubview:view];
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.font = [UIFont systemFontOfSize:10];
        [view addSubview:label];
        view.tag = i;
        [self.viewArray addObject:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [view addGestureRecognizer:tap];
    }
}

- (void)updateViewConstraints{
    
    UIView *lastView = self.view;
    NSInteger count = self.viewArray.count;
    
    //此处必须使用移除约束 否则乱七八糟
    if (self.isFirst) {
        for (NSInteger i = count; i > 0; i--) {
            UIView *view = [self.viewArray objectAtIndex:i-1];
            [view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
            }];
            [self.view bringSubviewToFront:view];
            lastView = view;
            NSLog(@"%zd",lastView.tag);
        }
    }else{
        for (NSInteger i = 0; i < count; i++) {
            UIView *view = [self.viewArray objectAtIndex:i];
            [view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
            }];
            [self.view bringSubviewToFront:view];
            lastView = view;
            NSLog(@"%zd",lastView.tag);
        }
    }
    
    [super updateViewConstraints];
}

- (void)onTap{
    
    self.isFirst = !self.isFirst;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (UIColor *)returnColor{
    
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    return color;
}

@end
