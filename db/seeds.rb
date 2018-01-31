# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    {
        name:"MissLi",
        tel:"18390918465",
        address:"七公寓二单元"
    },
    {
        name:"LittleBaby",
        tel:"15611110000",
        address:"七公寓二单元"
    }
])

Item.create([
    {
        name:'迷你煮锅',
        detail:'功率友好，不会跳闸，开小灶利器',
        original_price:55,
        second_price:30,
        wear_level:1,
        tag:"厨具",
        user_id:3
    },
    {
        name:'笔记本散热器',
        detail:'造型炫酷，风扇转动时自带蓝色闪光，美中不足是声音有点大',
        original_price:55,
        second_price:30,
        wear_level:1,
        tag:"数码",
        user_id:1
    }
])

Message.create([
    {
        item_id:1,
        sender_id:4,
        receiver_id:2,
        content:"这本书我也有，比她买的便宜，来看看吧"
    },
    {
        item_id:2,
        sender_id:4,
        receiver_id:3,
        content:"这锅宿管阿姨让用吗"
    },
    {
        item_id:3,
        sender_id:3,
        receiver_id:1,
        content:"好丑的散热器，送我也不要"
    }
    
])