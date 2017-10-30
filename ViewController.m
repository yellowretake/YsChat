//
//  ViewController.m
//  YsChat
//
//  Created by 黄欣 on 2017/8/4.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "ViewController.h"
#import "HxTableViewCell.h"
#import "HxFriendsModel.h"
#import "YsRoom.h"
#import "YsChatViewController.h"
static NSString *HxTableViewCellidf = @"HxTableViewCellidf";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{

    UITableView *_table;
}
@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic,strong)YsChatViewController *chatVc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聊天";
    _dataArray = [self getDataArray];
    [self _configView];
    UIButton *a = [UIButton buttonWithType:UIButtonTypeContactAdd];
    a.frame = CGRectMake(100, 100, 0, 0);
    [a addTarget:self action:@selector(scrol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:a];
}

-(void)scrol{

    if (_dataArray.count > 0) {
        // tableView 定位到的cell 滚动到相应的位置，后面的 atScrollPosition 是一个枚举类型
        [_table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }


}

-(NSMutableArray *)getDataArray{

    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:20];
    HxFriendsModel *item = [[HxFriendsModel alloc]init];
    item.from = [NSString stringWithFormat:@"1号聊天室"];
    item.message = @"快来聊天吧";
    item.avatarURL = [NSURL URLWithString:@"15f91f178a82b9015434fcad728da9773812ef9c.jpeg"];
    item.messageCount = 0;
    item.date = [NSDate date];
    [models addObject:item];
    return models;
}

-(void)_configView{

    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_table registerClass:[HxTableViewCell class] forCellReuseIdentifier:HxTableViewCellidf];
    _table.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_table];


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_chatVc == nil) {
        _chatVc = [[YsChatViewController alloc]init];
    }
    YsRoom *room = [[YsRoom alloc]init];
    room.roomname = @"2333聊天室";
    room.roomID = @"9527";
    room.idf = 233;
    _chatVc.user = room;
    [self.navigationController pushViewController:_chatVc animated:NO];
    
    [_table deselectRowAtIndexPath:indexPath animated:NO];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HxTableViewCellidf forIndexPath:indexPath];
    [cell setUserModel:_dataArray[indexPath.row]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
