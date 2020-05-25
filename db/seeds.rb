# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genres = Genre.create(
	[{name: "ケーキ", is_valid: true}, 
	 {name: "プリン", is_valid: true},
	 {name: "焼き菓子", is_valid: true},
	 {name: "キャンディ", is_valid: true}
	])

products=Product.create(
	[{name: "イチゴのタルトseed",explain: "イチゴのタルトの商品説明です",notax_price:'3000',image_id: "1999411714de6d903b3e0a2a383fc4b0c9fb0e950086cee799477c2ae546",genre_id:'1',is_valid: true}, 
	 {name: "カラフルキャンディseed",explain: "カラフルキャンディの商品説明です",notax_price:'280',image_id:"e745e00f9283d3e446bbd445a1233a4eeeb7f9c7f628c2455471f7190708",genre_id:'4',is_valid: true}
	])