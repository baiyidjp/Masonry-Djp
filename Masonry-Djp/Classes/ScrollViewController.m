//
//  ScrollViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.pagingEnabled = NO;
    [self.view addSubview:scrollView];
    
    UILabel *lastLabel = nil;
    
    for (NSInteger i = 0; i<20; i++) {
        UILabel *label = [[UILabel alloc]init];
        [scrollView addSubview:label];
        label.text = [self returnText];
        label.textColor = [self returnColor];
        label.numberOfLines = 0;
        label.layer.borderColor = [UIColor greenColor].CGColor;
        label.layer.borderWidth = 2.0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(self.view).offset(-10);
            
            if (lastLabel) {
                make.top.equalTo(lastLabel.mas_bottom).offset(10);
            }else{
                make.top.equalTo(10);
            }
        }];
        lastLabel = label;
    }
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(lastLabel.mas_bottom).offset(10);
    }];
    
}

- (UIColor *)returnColor{
    
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    return color;
}

- (NSString *)returnText{
    
    NSInteger count = arc4random_uniform(20)+10;
    NSMutableString *text = [[NSMutableString alloc]init];
    for (NSInteger i =0 ; i < count; i++) {
        [text appendString:@"我来测试...-"];
    }
    return text;
}

@end
