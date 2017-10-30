//
//  YsMessageTableViewCell.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/9.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YsModel.h"
#import "UIViewExt.h"
@interface YsMessageTableViewCell : UITableViewCell
@property(nonatomic,strong)YsModel *model;

@property (nonatomic, strong) UIImageView *avatarImageView;                 // 头像
@property (nonatomic, strong) UIImageView *messageBackgroundImageView;      // 消息背景
@property (nonatomic, strong) UIImageView *messageSendStatusImageView;      // 消息发送状态

@end
