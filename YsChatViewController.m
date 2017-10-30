//
//  YsChatViewController.m
//  YsChat
//
//  Created by 黄欣 on 2017/8/8.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "YsChatViewController.h"
#import "YsChatTableViewController.h"
#import "UIViewExt.h"
#import "DataBase.h"
@interface YsChatViewController ()<YsChatTableViewControllerDelegate,ChatViewDelegate>
@property(nonatomic,strong)YsChatTableViewController *chatMessageVC;
@property(nonatomic,assign)float viewHeight;
@property(nonatomic,strong)UIButton * button;
@property(nonatomic,strong)UITextField *textFd;
@property(nonatomic,strong)DataBase *database;
@property(nonatomic,strong)ChatView *chatView;
@end

@implementation YsChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _configViews];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _viewHeight = self.view.frame.size.height - 49-64;
    [self.view  addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatView];
    [self loadSavedMessage];
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}

-(void)loadSavedMessage{

    NSArray *arry = [self.database getTalk:_user];
    
    for (int i = 0; i<arry.count; i++) {
        YsModel *message = arry[i];
        message.messageType = YSMessageTypeText;
        if (i%2 == 1) {
            message.ownerTyper = YSMessageOwnerTypeSelf;
        }else{
            message.ownerTyper = YSMessageOwnerTypeOther;
        }
        
        [self.chatMessageVC addNewMessage:message];
    }
    
}

-(void)_configViews{
 
    
}

#pragma mark delegate
-(void)didTapChat:(YsChatTableViewController *)YsChatTableViewController{
    [_chatView.textView resignFirstResponder];
}

-(void)chatBox:(ChatView *)chatBox sendMessage:(NSString *)textMessage{

    YsModel *message = [YsModel new];
    message.messageType = YSMessageTypeText;
    message.ownerTyper = YSMessageOwnerTypeOther;
    message.text = textMessage;
    [self.database addTalk:1 with:textMessage];
    [self.chatMessageVC addNewMessage:message];
    
    YsModel *message1 = [YsModel new];
    message1.messageType = YSMessageTypeText;
    message1.ownerTyper = YSMessageOwnerTypeSelf;
    message1.text = textMessage;
    [self.database addTalk:2 with:textMessage];
    [self.chatMessageVC addNewMessage:message1];
    [self.chatMessageVC scrollToBottom];

}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    self.viewHeight = kbSize.height;
    NSLog(@"hight_hitht:%f",kbSize.height);
    [UIView animateWithDuration:0.3 animations:^{
        _chatView.top = _chatView.top-kbSize.height;
        _chatMessageVC.view.height = _chatMessageVC.view.height - kbSize.height;
        [_chatMessageVC scrollToBottom];
    }];
    
}

//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    [UIView animateWithDuration:0.3 animations:^{
        _chatView.top = _chatView.top+kbSize.height;
        _chatMessageVC.view.height = _chatMessageVC.view.height + kbSize.height;
    }];
}

-(YsChatTableViewController *)chatMessageVC{

    if (_chatMessageVC == nil) {
        _chatMessageVC = [[YsChatTableViewController  alloc] init];
        [_chatMessageVC.view setFrame:CGRectMake(0, 64, self.view.width, _viewHeight)];// 0  状态 + 导航 宽 viweH - tabbarH
        [_chatMessageVC setDelegate:self];// 代理
    }
    
    return _chatMessageVC;

}

-(DataBase *)database{

    if (_database == nil) {
        _database = [[DataBase alloc]initWithIdf:_user.idf];
    }
    return _database;
}

-(ChatView *)chatView{

    if (_chatView == nil) {
        _chatView = [[ChatView alloc]initWithFrame:CGRectMake(0, self.view.height-49, kScreenWidth, 350)];
        _chatView.delegate = self;
    }
    return _chatView;

}

-(void)setUser:(YsRoom *)user
{
    _user = user;
    [self.navigationItem setTitle:user.roomname];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
