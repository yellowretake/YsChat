//
//  DataBase.m
//  聊天记录
//
//  Created by 黄欣 on 2017/9/14.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "DataBase.h"
@implementation DataBase


-(id)initWithIdf:(int)idf{

    NSString *idpath = [NSString stringWithFormat:@"Documents/%d.db",idf];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:idpath];
    _db = [[FMDatabase alloc] initWithPath:path];
    BOOL res = [_db open];
    if (res == NO) {
        NSLog(@"打开数据库失败");
        return self;
    }else{
        
        NSLog(@"打开数据库%@",path);
    }
        //对话列表
    res = [_db executeUpdate:@"create table if not exists chat(uid integer primary key autoincrement,direct integer,talk text)"];
    if (res == NO) {
        NSLog(@"创建对话表失败");
        [_db close];
        return self;
    }else{
        NSLog(@"创建对话表ok");
    }


    return self;
}

-(void)addTalk:(int)dir with:(NSString *)str{

    BOOL res = [_db executeUpdate:@"INSERT INTO chat (direct, talk) VALUES (?, ?);",[NSNumber numberWithInt:dir],str];
    if (res) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");

    }
}

-(NSArray *)getTalk:(YsRoom *)use{
    NSMutableArray *arry = [NSMutableArray array];
    NSString *a = @"select *from chat order by uid desc limit 5";
    FMResultSet *set = [_db executeQuery:@"select *from chat"];
    while ([set next]) {
        
        NSString *name = [set stringForColumn:@"talk"];
        int a = [set intForColumn:@"direct"];
        YsModel *model = [YsModel new];
        model.text = name;
        [arry addObject:model];
        NSLog(@"talk=%@\n  dir=%d",name,a);
    }
    return arry;
}

-(void)insert{
//    for (int i = 0; i<10; i++) {
//                 NSString *name = [NSString stringWithFormat:@"jack-%d", i];
//                 // executeUpdate : 不确定的参数用?来占位
//                 [_db executeUpdate:@"INSERT INTO user (name, idf) VALUES (?, ?);", name, @(arc4random_uniform(40))];
//    
//    }
//    
//    
//    FMResultSet *resultSet = [_db executeQuery:@"SELECT * FROM user"];
//    
//     // 2.遍历结果
//     while ([resultSet next]) {
//             int ID = [resultSet intForColumn:@"uid"];
//             NSString *name = [resultSet stringForColumn:@"name"];
//             int age = [resultSet intForColumn:@"idf"];
//             NSLog(@"%d %@ %d", ID, name, age);
//         }
    [_db executeUpdate:@"drop table if exists user"];
    [_db executeUpdate:@"drop table if exists chat"];

    
}


@end
