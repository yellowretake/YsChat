//
//  ChatView.m
//  YsChat
//
//  Created by 黄欣 on 2017/10/24.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "ChatView.h"
@interface ChatView ()<UITextViewDelegate>

@property (nonatomic, strong) UIButton *voiceBtn; // 声音
@property (nonatomic, strong) UIButton *moreBtn;  // 更多
@property (nonatomic, strong) UIButton *talkBtn;  // 聊天键盘
@property (nonatomic, strong) UIButton *faceBtn;  // 表情


@end
@implementation ChatView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
    
        [self addSubview:self.voiceBtn];
        [self addSubview:self.textView];
        [self addSubview:self.faceBtn];
        [self addSubview:self.moreBtn];
        
    
    }
        
        
    return self;
}

-(void)moreDown{

    UIImageView *vie = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    vie.backgroundColor = [UIColor redColor];
    [self addSubview:vie];
}

-(UIButton *)voiceBtn{

    if (_voiceBtn == nil) {
        _voiceBtn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 49, 49)];
        [_voiceBtn setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
    }
    return _voiceBtn;

}

- (UITextView *) textView
{
    if (_textView == nil) {
        /**
         
         */
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(49, 2, kScreenWidth-150, 44)];
        [_textView setFont:[UIFont systemFontOfSize:16.0f]];
        [_textView.layer setMasksToBounds:YES];
        [_textView.layer setCornerRadius:4.0f];
        [_textView.layer setBorderWidth:0.5f];
        _textView.delegate = self;
        [_textView.layer setBorderColor:[UIColor blackColor].CGColor];
        [_textView setScrollsToTop:NO];
        [_textView setReturnKeyType:UIReturnKeySend];// 返回按钮更改为发送
        [_textView setDelegate:self];
    }
    return _textView;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if ([text isEqualToString:@"\n"]){
        [self sendMessage];
        return NO;
    }


    return YES;
}

-(void)sendMessage{

    if (self.textView.text.length > 0) {     // send Text
        if (_delegate && [_delegate respondsToSelector:@selector(chatBox:sendMessage:)]) {
            [_delegate chatBox:self sendMessage:self.textView.text];
        }
    }
    [self.textView setText:@""];


}

-(UIButton *)faceBtn{

    if (_faceBtn == nil) {
        _faceBtn = [[UIButton alloc]initWithFrame:CGRectMake(_textView.right, 0, 49, 49)];
        [_faceBtn setImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
    }

    return _faceBtn;

}

-(UIButton *)moreBtn{
    
    if (_moreBtn == nil) {
        _moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(_faceBtn.right, 0, 49, 49)];
        [_moreBtn setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreDown) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _moreBtn;

}




@end
