### 本项目已部署至heroku 地址：https://eeserver.herokuapp.com/

* Rails version: 5.1.4

### 部署方法
1. down到本地，在项目根目录打开命令行窗口
2. 数据库迁移：rails db:migrate 
3. 插入测试数据：rails db:seed
4. 开启服务器：rails server 

### 外部交互
1.	物品搜索： /search
* request：物品名称（全匹配）
* response：匹配的物品+发布者
* [{ id:1, …, user:{…}},{ id:2, …, user:{…}},…]
2.	首页：  /items
* request：无
* response：返回全部物品集合
* [{ id:1, … },{…},…]
3.	物品详情:  /items/#id
* request：物品id
* response：物品详情+发布者详情+留言
* { id:1, …, user:{…}, messages:[{…}, …]}
4.	查看个人页面:  /me
* request：用户id
* response：当前用户详情
* { id:1, … }
5.	查看用户页面:  /users/#id
* request：用户id
* response：用户详情
* { id:1, … }
6.	查看我发布的物品:  /me/posted
* request：用户id
* response：用户发布的物品集合
* [{ id:1, … },{…},…]
7.	查看我收到的消息:  /me/message
* request：用户id
* response：用户收到的消息集合
* [{ id:1, … },{…},…]
8.	发布物品:  /new
* request：post 发布者id+物品信息
* response：成功 success；失败 错误信息

9.	修改物品:  /items/#id
* request：patch/put 物品id+物品信息
* response：成功 success；失败 错误信息

10.	修改个人信息:  /me/update
* request：patch/put 用户id+个人信息
* respons：成功 success；失败 错误信息

11.	发布留言:  /new_message
* request：post 物品id+发送者id+接收者id+留言内容
* response：成功 success；失败 错误信息

12.    上传图片:  /upload_pic
* request：post 物品id+上传物品图片（一张）
* response：成功 success；失败 错误信息

### 内部交互
1.	获得授权用户信息（新建或更新用户） /create_or_get_user
* request：post 用户name+上传用户头像
* response：对应user

************************
### 2018-01-31更改说明：
1. 物品没有加“手机”、“地址”字段
2. 物品和另一个物品图片表相关联，实现一对多（暂缓实现，目前在物品表中有一个picture字段）
3. 物品增加“状态”字段
4. 修改物品和发布物品拆分成两个action
5. 新增消息功能路由为  /new_message
6. 一切和时间有关的字段均未处理（初步想法：使用数据库中自带的字段created_at和updated_at）

### 2018-02-02更改说明：
1. 更改gemfile，将

       gem 'sqlite3'

    替换为
    
       group :development do
          
         gem 'sqlite3' 
                
       end
              
       group :production do
              
         gem 'pg'
                
       end
              
    参考https://guides.railsapps.org/rails-deploy-to-heroku.html
 
### 2018-02-03更改说明：
1. 实现上传图片功能，使用gem carrierwave（https://github.com/carrierwaveuploader/carrierwave）
2. 将所有find改成find_by，因为find没有查询到结果，会抛出一个ActiveRecord::RecordNotFound异常，而find_by没有查询到结果，会返回nil

### 2018-02-04更改说明：
1. 增加下载图片/查看图片功能
 
    picture.url里保存的是服务器中图片的存储路径，客户端无法直接访问这个路径来获得图片，故需要另写一个请求图片下载地址的方法，方法中主要起作用的函数为：

       send_file "#{Rails.root}/public#{item.picture.url}"
  
### 2018-02-05更改说明：
1. as_json的使用方法

    模型关系为：
    
       item belongs_to user
       
       item has_many messages
     
    * 要在返回的json中把user作为item的一个字段加入，则方法如下：
       
          render json: @item.as_json(include: :user)  
          
    * 要在返回的json中把messages作为item的一个字段加入，则方法如下：
    
          render json: @item.as_json(include: :user)
    
    * 要在返回的json中把user和messages都加入，则方法如下：
    
          render json: @item.as_json(:methods => [:user], :include => [:messages])
          
2. 改变rails的服务器时区

       config.time_zone = 'Beijing' # rails系统对显示时间的默认设置
       
       config.active_record.default_timezone = :local #决定active_record对数据库交互的时区设置，也就是影响created_at和updated_at在数据库的记录时间，只有两个参数:utc和:local，rails初始化时默认是utc，所以默认保存到数据库的时间是utc时间。值改成local则表示数据库存储使用当地时间
