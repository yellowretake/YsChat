//
//  HxTableViewCell.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/7.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HxFriendsModel.h"
@interface HxTableViewCell : UITableViewCell
@property(nonatomic,strong)HxFriendsModel *user;
@property(nonatomic,strong)UIImageView *headerView;
@property(nonatomic,strong)UILabel *date;
@property(nonatomic,strong)UILabel *messgae;
@property(nonatomic,strong)UILabel *name;
-(void)setUserModel:(HxFriendsModel *)model;
@end
