//
//  YsTextCell.m
//  YsChat
//
//  Created by 黄欣 on 2017/8/9.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import "YsTextCell.h"

@implementation YsTextCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.messageTextLabel];

    }
    return self;
    
    
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    /**
     *  Label 的位置根据头像的位置来确定
     */
    float y = self.avatarImageView.origin.y + 11;
    float x = self.avatarImageView.origin.x + (self.model.ownerTyper == YSMessageOwnerTypeSelf ? - self.messageTextLabel.width - 27 : self.avatarImageView.width + 23);
    [self.messageTextLabel setOrigin:CGPointMake(x, y)];
    
    x -= 18;                                    // 左边距离头像 5
    y = self.avatarImageView.origin.y - 5;       // 上边与头像对齐 (北京图像有5个像素偏差)
    float h = MAX(self.messageTextLabel.height + 30, self.avatarImageView.height + 10);
    [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.messageTextLabel.width + 40, h)];
}

-(void)setModel:(YsModel *)model{
    [super setModel:model];
    _messageTextLabel.text = model.text;
    _messageTextLabel.size = model.messageSize;
}


- (UILabel *) messageTextLabel
{
    if (_messageTextLabel == nil) {
        _messageTextLabel = [[UILabel alloc] init];
        [_messageTextLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_messageTextLabel setNumberOfLines:0];
    }
    return _messageTextLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
