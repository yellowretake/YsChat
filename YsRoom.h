//
//  YsRoom.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/8.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YsRoom : NSObject
@property (nonatomic, strong) NSString *roomname;
@property (nonatomic, strong) NSString *roomID;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic,assign) int uid;
@property (nonatomic,assign) int idf;
@end
