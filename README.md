# YsChat
使用SQL实现存储功能的聊天界面,在用户下次进入app时仍然可以保留以前的聊天记录
## 使用
YsRoom *room = [[YsRoom alloc]init];<br>  
room.roomname = @"2333聊天室";<br>  
room.roomID = @"9527";<br>  
room.idf = 233;<br>  
_chatVc.user = room;<br>  
添加用户

###存储功能
YsModel *message1 = [YsModel new];<br> 
message1.messageType = YSMessageTypeText;<br> 
message1.ownerTyper = YSMessageOwnerTypeSelf;<br> 
message1.text = textMessage;<br> 
添加进SPQL<br> 
[self.database addTalk:2 with:textMessage];
