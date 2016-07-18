//
//  JPTableViewCell.h
//  Masonry-Djp
//
//  Created by tztddong on 16/7/7.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPCellModel :NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *desetext;
@property(nonatomic,assign)BOOL isExpand;

@end

@interface JPTableViewCell : UITableViewCell

@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *descLabel;
@property(nonatomic,weak)UIView *lineView;

- (void)setValueWithModel:(JPCellModel *)model;
@property(nonatomic,strong)JPCellModel *model;
+ (CGFloat)cellHeightWithModel:(JPCellModel *)model;

@property (nonatomic,copy)void(^clickDescBlock)(NSIndexPath *indexPath);

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
