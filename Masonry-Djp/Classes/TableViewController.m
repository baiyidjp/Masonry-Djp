//
//  TableViewController.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/6.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "TableViewController.h"
#import "JPTableViewCell.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation TableViewController

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i = 0 ; i < 5 ; i++) {
            JPCellModel *model = [[JPCellModel alloc]init];
            model.title = [NSString stringWithFormat:@"%d标题而已标题而已标题而已标题而已标题而已",i];
            model.desetext = @"文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了文字罢了";
            model.isExpand = 0;
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"tableCell";
    
    JPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[JPTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.indexPath = indexPath;
    
    JPCellModel *model = self.dataArray[indexPath.row];
    [cell setValueWithModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setClickDescBlock:^(NSIndexPath *cellIndexPath){
        model.isExpand = !model.isExpand;
        [self.tableView reloadRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JPCellModel *model = self.dataArray[indexPath.row];
    
    return [JPTableViewCell cellHeightWithModel:model];
}

@end
