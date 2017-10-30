//
//  YsModel.h
//  YsChat
//
//  Created by 黄欣 on 2017/8/9.
//  Copyright © 2017年 黄欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YsRoom.h"

typedef NS_ENUM(NSInteger,YSMessageOwnerType){
    YSMessageOwnerTypeSelf,     // 自己发送的消息
    YSMessageOwnerTypeOther,    // 接收到的他人消息

} ;

typedef NS_ENUM(NSInteger ,YSMessageType) {

    YSMessageTypeText,          // 文字
    YSMessageTypeImage,         // 图片

};

typedef NS_ENUM(NSInteger,YSMessageSendState) {

    YSMessageSendSuccess,       // 消息发送成功
    YSMessageSendFail,          // 消息发送失败

};
@interface YsModel : NSObject
@property(nonatomic,strong)YsRoom *user;
@property (nonatomic, strong) NSDate *date;                         // 发送时间
@property (nonatomic, strong) NSString *dateString;                 // 格式化的发送时间
@property (nonatomic, assign) YSMessageType messageType;            // 消息类型
@property (nonatomic, assign) YSMessageOwnerType ownerTyper;        // 发送者类型
@property (nonatomic, assign) YSMessageSendState readState;         // 读取状态

@property (nonatomic, assign) CGSize messageSize;                   // 消息大小
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSString *cellIndentify;


#pragma mark - 文字消息
@property (nonatomic, strong) NSString *text;                       // 文字信息
@property (nonatomic, strong) NSAttributedString *attrText;         // 格式化的文字信息

#pragma mark - 图片消息
@property (nonatomic, strong) NSString *imagePath;                  // 本地图片Path
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) UIImage *image;                       // 图片缓存
@end
