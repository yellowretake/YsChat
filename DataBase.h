//
//  DataBase.h
//  聊天记录
//
//  Created by 黄欣 on 2017/9/14.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "YsRoom.h"
#import "YsModel.h"
@interface DataBase : NSObject{
    FMDatabase *_db;
}

-(id)initWithIdf:(int)idf;

-(void)addTalk:(int)dir with:(NSString *)str;

-(NSArray *)getTalk:(YsRoom *)use;

-(void)insert;
@end
