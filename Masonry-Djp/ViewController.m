//
//  ViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import "BaseUesViewController.h"
#import "UpdateSizeViewController.h"
#import "RemakeUpdateViewController.h"
#import "TotalViewUpdateViewController.h"
#import "MoreViewViewController.h"
#import "MultipliedByViewController.h"
#import "TableViewController.h"
#import "ScrollMoreViewController.h"
#import "ScrollNowViewController.h"
#import "ScrollViewController.h"
#import "BaseAnimatedViewController.h"

static NSInteger BtnTag = 201607060;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickBtn:(UIButton *)sender {
    
    NSInteger index = sender.tag - BtnTag;
    
    UIViewController *pushCtrl;
    
    switch (index) {
        case 0:
            pushCtrl = [[BaseUesViewController alloc]init];
            break;
        case 1:
            pushCtrl = [[UpdateSizeViewController alloc]init];
            break;
        case 2:
            pushCtrl = [[RemakeUpdateViewController alloc]init];
            break;
        case 3:
            pushCtrl = [[TotalViewUpdateViewController alloc]init];
            break;
        case 4:
            pushCtrl = [[MoreViewViewController alloc]init];
            break;
        case 5:
            pushCtrl = [[MultipliedByViewController alloc]init];
            break;
        case 6:
            pushCtrl = [[BaseAnimatedViewController alloc]init];
            break;
        case 7:
            pushCtrl = [[TableViewController alloc]init];
            break;
        case 8:
            pushCtrl = [[ScrollViewController alloc]init];
            break;
        case 9:
            pushCtrl = [[ScrollMoreViewController alloc]init];
            break;
        case 10:
            pushCtrl = [[ScrollNowViewController alloc]init];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:pushCtrl animated:YES];
}

@end
