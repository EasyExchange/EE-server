# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Rails version: 5.1.4

外部交互
1.	物品搜索： /search
	request：物品名称（全匹配）
	response：匹配的物品+发布者
[{ id:1, …, user:{…}},{ id:2, …, user:{…}},…]
2.	首页：  /items
	request：无
	response：返回全部物品集合
[{ id:1, … },{…},…]
3.	物品详情:  /items/#id
	request：物品id
	response：物品详情+发布者详情+留言
{ id:1, …, user:{…}, messages:[{…}, …]}
4.	查看个人页面:  /me
	request：用户id
	response：当前用户详情
{ id:1, … }
5.	查看用户页面:  /users/#id
	request：用户id
	response：用户详情
{ id:1, … }
6.	查看我发布的物品:  /me/posted
	request：用户id
	response：用户发布的物品集合
[{ id:1, … },{…},…]
7.	查看我收到的消息:  /me/message
	request：用户id
	response：用户收到的消息集合
[{ id:1, … },{…},…]
8.	发布物品:  /new
	request：post 发布者id+物品信息
	response：成功 success；失败 错误信息

9.	修改物品:  /items/#id
	request：patch/put 物品id+物品信息
	response：成功 success；失败 错误信息

10.	修改个人信息:  /me/update
	request：patch/put 用户id+个人信息
	respons：成功 success；失败 错误信息

11.	发布留言:  /new_message
	request：post 物品id+发送者id+接收者id+留言内容
	response：成功 success；失败 错误信息

内部交互
1.	获得授权用户信息（新建用户）

2018-01-31改动：
1.物品没有加“手机”、“地址”字段
2.物品和另一个物品图片表相关联，实现一对多
3.物品增加“状态”字段
4.修改物品和发布物品拆分成两个action
5.新增消息功能路由为  /new_message


