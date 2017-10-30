//
//  UserList.h
//  聊天记录
//
//  Created by 黄欣 on 2017/9/14.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserList : NSObject
@property (nonatomic,strong) NSArray *talkL;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *menpai;

@property (nonatomic,assign) int uid;

@property (nonatomic,assign) int idf;


@end
