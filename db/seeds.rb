# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    {
        name:"dc",
        tel:"13011853993",
        address:"七公寓二单元"
    },
    {
        name:"yan",
        tel:"18800006666",
        address:"七公寓二单元"
    }
])

Item.create(
    name:'机器学习',
    detail:'著名的西瓜书，作者是周志华老师',
    original_price:88,
    second_price:80,
    wear_level:0,
    tag:"专业书",
    user_id:1
)

Message.create(
    item_id:1,
    sender_id:2,
    receiver_id:1,
    content:"你的书我看上了，能便宜点吗"
)