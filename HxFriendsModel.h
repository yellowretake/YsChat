//
//  HxFriendsModel.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/7.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HxFriendsModel : NSObject
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int messageCount;
@property (nonatomic, strong) NSURL *avatarURL;
@end
