//
//  ChatView.h
//  YsChat
//
//  Created by 黄欣 on 2017/10/24.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatView;
@protocol ChatViewDelegate <NSObject>

- (void)chatBox:(ChatView *)chatBox sendMessage:(NSString *)textMessage;

@end

@interface ChatView : UIView
@property (nonatomic, strong) UITextView *textView;  // 输入
@property(nonatomic,assign)id<ChatViewDelegate>delegate;
@end
