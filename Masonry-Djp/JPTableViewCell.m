//
//  JPTableViewCell.m
//  Masonry-Djp
//
//  Created by tztddong on 16/7/7.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "JPTableViewCell.h"

@implementation JPCellModel


@end

@implementation JPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews{

    UIImageView *imgView = [[UIImageView alloc]init];
    [self.contentView addSubview:imgView];
    imgView.backgroundColor = [UIColor purpleColor];
    imgView.layer.borderColor = [UIColor yellowColor].CGColor;
    imgView.layer.borderWidth = 2;
    imgView.layer.cornerRadius = 30;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(20);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel = titleLabel;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
#warning 使用自动布局 在iOS8.0之前 必须加上这句代码 手动限制label的宽度
    self.titleLabel.preferredMaxLayoutWidth = w - 100;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_top);
        make.left.equalTo(imgView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    UILabel *descLabel = [[UILabel alloc]init];
    [self.contentView addSubview:descLabel];
    descLabel.textColor = [UIColor blueColor];
    descLabel.numberOfLines = 2;
    descLabel.font = [UIFont systemFontOfSize:13];
    self.descLabel = descLabel;
    self.descLabel.preferredMaxLayoutWidth = w - 100;
    descLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDesc)];
    [descLabel addGestureRecognizer:tap];
    
    UIView *lineView = [[UIView alloc]init];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = [UIColor grayColor];

    self.lineView = lineView;
    
}

- (void)setValueWithModel:(JPCellModel *)model{
    self.model = model;
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desetext;
    NSLog(@"%zd",model.isExpand);
    if (model.isExpand) {
        self.descLabel.numberOfLines = 0;
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel);
        }];

    }else{
        self.descLabel.numberOfLines = 2;
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel);
        }];
    }
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.height.equalTo(1);
        make.top.equalTo(self.descLabel.mas_bottom).offset(20);
    }];
}

+ (CGFloat)cellHeightWithModel:(JPCellModel *)model{
    
    JPTableViewCell *cell = [[JPTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    [cell setValueWithModel:model];
    [cell layoutIfNeeded];

    CGFloat height  = CGRectGetMaxY(cell.lineView.frame);

    return height;
}

- (void)tapDesc{

    if (self.clickDescBlock) {
        self.clickDescBlock(self.indexPath);
    }
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView layoutIfNeeded];
}
@end
