//
//  YsModel.m
//  YsChat
//
//  Created by 黄欣 on 2017/8/9.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "YsModel.h"

#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width

static UILabel *label = nil;
@implementation YsModel

-(id)init
{
    if (self = [super init]) {
        
        if (label == nil) {
            label = [[UILabel alloc] init];
            [label setNumberOfLines:0];
            [label setFont:[UIFont systemFontOfSize:16.0f]];
        }
    }
    
    return self;
}

-(void) setText:(NSString *)text
{
    _text = text;
    if (text.length > 0) {
        
//        _attrText = [ZXChatHelper formatMessageString:text];
        
    }
}

-(CGSize)messageSize{

    switch (self.messageType) {
        case YSMessageTypeText:
            [label setText:_text];
            _messageSize = [label sizeThatFits:CGSizeMake(0.6*WIDTH_SCREEN, MAXFLOAT)];
            break;
        case YSMessageTypeImage:
            _messageSize = CGSizeMake(0.3*WIDTH_SCREEN, 200);
            break;
        default:
            break;
    }

    return _messageSize;

}

- (void) setMessageType:(YSMessageType)messageType
{
    
    _messageType = messageType;
    switch (messageType) {
        case YSMessageTypeText:
            self.cellIndentify = @"textidf";
            break;
            
        case YSMessageTypeImage:
            self.cellIndentify = @"imageidf";
            break;
            
        default:
            break;
    }
}

-(CGFloat) cellHeight
{
    
    switch (self.messageType){
            // cell 上下间隔为10
        case YSMessageTypeText:
            
            return self.messageSize.height + 40 > 60 ? self.messageSize.height + 40 : 60;
            break;
            
        case YSMessageTypeImage:
            
            return self.messageSize.height + 20;
            break;
            
        default:
            
            break;
    }
    
    return 0;
}


@end
