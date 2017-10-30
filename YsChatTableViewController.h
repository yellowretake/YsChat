//
//  YsChatTableViewController.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/9.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YsModel.h"
@class YsChatTableViewController;
@protocol YsChatTableViewControllerDelegate <NSObject>

-(void)didTapChat:(YsChatTableViewController *)YsChatTableViewController;

@end

@interface YsChatTableViewController : UITableViewController

@property(nonatomic,strong)id <YsChatTableViewControllerDelegate> delegate;
/**
 *  改变数据源方法，添加一条消息，刷新数据
 *
 *  @param message 添加的消息
 */
- (void) addNewMessage:(YsModel *)message;

/**
 *   添加一条消息就让tableView滑动
 */
- (void) scrollToBottom;
@end
