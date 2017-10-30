//
//  HxTableViewCell.m
//  YsChat
//
//  Created by 黄欣 on 2017/8/7.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "HxTableViewCell.h"

@implementation HxTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _configView];
    }
    return self;


}

-(void)setUserModel:(HxFriendsModel *)model{
    _user = model;
    [_date setText:@"10:12"];
    [_name setText:model.from];
    [_messgae setText:model.message];
    [_headerView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", model.avatarURL]]];
}

-(void)_configView{
    _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    [_headerView.layer setMasksToBounds:YES];
    [_headerView.layer setCornerRadius:5.0f];
    [self addSubview:_headerView];
    
    _date = [[UILabel alloc]initWithFrame:CGRectMake(250, 5, 50, 10)];
    [_date setAlpha:0.8];
    [_date setFont:[UIFont systemFontOfSize:12]];
    [_date setTextAlignment:NSTextAlignmentRight];
    [_date setTextColor:[UIColor grayColor]];
    [self addSubview:_date];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 150, 8)];
    [_name setFont:[UIFont systemFontOfSize:16]];
    [_name setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_name];
    
    _messgae = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, 150, 8)];
    [_messgae setAlpha:0.8];
    [_messgae setFont:[UIFont systemFontOfSize:16]];
    [_messgae setTextAlignment:NSTextAlignmentLeft];
    [_messgae setTextColor:[UIColor grayColor]];
    [self addSubview:_messgae];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
