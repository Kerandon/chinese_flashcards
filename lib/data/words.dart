import '../models/word.dart';

//TODO insert below data into an SQLite database instead

final List<Word> words = [

  Word(topic: "Beach", english: "Swimsuit", pinyin: "Yóu Yǒng Yī", character: "游泳衣"),
  Word(topic: "Beach", english: "Seashell", pinyin: "Bèi Ké", character: "贝壳"),
  Word(topic: "Beach", english: "Sunscreen", pinyin: "Fáng Shài Shuāng", character: "防晒霜"),
  Word(topic: "Beach", english: "Surfboard", pinyin: "Chōng Làng Bǎn", character: "冲浪板"),

  Word(topic: "Birds", english: "Kiwi", pinyin: "Qí Yì Niǎo", character: "奇异鸟"),
  Word(topic: "Birds", english: "Duck", pinyin: "Yā Zi", character: "鸭子"),
  Word(topic: "Birds", english: "Flamingo", pinyin: "Huǒ Liè Niǎo", character: "火烈鸟"),

  Word(topic: "Body", english: "Nose", pinyin: "Bí Zi", character: "鼻子"),
  Word(topic: "Body", english: "Eye", pinyin: "Yǎn Jīng", character: "眼睛"),
  Word(topic: "Body", english: "Mouth", pinyin: "Zuǐ Ba", character: "嘴巴"),
  Word(topic: "Body", english: "Ear", pinyin: "Ěr Duo", character: "耳朵"),

  Word(topic: "City", english: "Hospital", pinyin: "Yī Yuàn", character: "医院"),
  Word(topic: "City", english: "Fire Station", pinyin: "Xiāo Fáng jú", character: "消防局"),
  Word(topic: "City", english: "Bank", pinyin: "Yín Háng", character: "银行"),

  Word(topic: "Dessert", english: "Ice Cream", pinyin: "Bīng Qín Lín", character: "冰淇淋"),
  Word(topic: "Dessert", english: "Chocolate", pinyin: "Qiǎo Kè Lì", character: "巧克力"),
  Word(topic: "Dessert", english: "Donut", pinyin: "Tián Tián Quān", character: "甜甜圈"),

  Word(topic: "Drinks", english: "Juice", pinyin: "Guǒ Zhī", character: "果汁"),
  Word(topic: "Drinks", english: "Beer", pinyin: "Pí Jiǔ", character: "啤酒"),
  Word(topic: "Drinks", english: "Milk", pinyin: "Niú Nǎi", character: "牛奶"),

  Word(topic: "Fruit", english: "Apple", pinyin: "Píng Guǒ", character: "苹果"),
  Word(topic: "Fruit", english: "Orange", pinyin: "Jú Zi", character: "橘子"),
  Word(topic: "Fruit", english: "Banana", pinyin: "Xiāng Jiāo", character: "香蕉"),

  Word(topic: "Insects", english: "Grasshopper", pinyin: "Zhà Měng", character: "蚱蜢"),
  Word(topic: "Insects", english: "Fly", pinyin: "Cāng Yíng", character: "苍蝇"),
  Word(topic: "Insects", english: "Spider", pinyin: "Zhī Zhū", character: "蜘蛛"),

  Word(topic: "Jobs", english: "Police Officer", pinyin: "Jǐng Chá", character: "警察"),
  Word(topic: "Jobs", english: "Construction Worker", pinyin: "Jiàn Zhú Gōng Rén", character: "建筑工人"),
  Word(topic: "Jobs", english: "Detective", pinyin: "Zhēn Tàn", character: "侦探"),

  Word(topic: "Land Animals", english: "Tiger", pinyin: "Lǎo Hǔ", character: "老虎"),
  Word(topic: "Land Animals", english: "Bear", pinyin: "Xióng", character: "熊"),
  Word(topic: "Land Animals", english: "Beaver", pinyin: "Hǎi Lí", character: "海狸"),
  Word(topic: "Land Animals", english: "Camel", pinyin: "Luò Tuó", character: "骆驼"),
  Word(topic: "Land Animals", english: "Dog", pinyin: "Gǒu", character: "狗"),

  Word(topic: "Marine Life", english: "Dolphin", pinyin: "Hǎi Tún", character: "海豚"),
  Word(topic: "Marine Life", english: "Shark", pinyin: "Shā Yú", character: "鲨鱼"),
  Word(topic: "Marine Life", english: "Whale", pinyin: "Jīng Yú", character: "鲸鱼"),

  Word(topic: "Music", english: "Piano", pinyin: "Gāng Qín", character: "钢琴"),
  Word(topic: "Music", english: "Flute", pinyin: "Cháng Dí", character: "长笛"),

  Word(topic: "Nature", english: "Tree", pinyin: "Shù", character: "树"),
  Word(topic: "Nature", english: "Rock", pinyin: "Shí Tou", character: "石头"),

  Word(topic: "School", english: "School Bag", pinyin: "Shū Bāo", character: "书包"),
  Word(topic: "School", english: "Computer", pinyin: "Diànnǎo", character: "电脑"),
  Word(topic: "School", english: "Pen", pinyin: "Bǐ", character: "笔"),

  Word(topic: "Shapes", english: "Triangle", pinyin: "Sān Jiǎo Xíng", character: "三角形"),
  Word(topic: "Shapes", english: "Circle", pinyin: "Yuán Xíng", character: "圆形"),
  Word(topic: "Shapes", english: "Square", pinyin: "Zhèng Fāng Xíng", character: "正方形"),

  Word(topic: "Sports", english: "Tennis", pinyin: "Wǎng Qiú", character: "网球"),
  Word(topic: "Sports", english: "Rugby", pinyin: "Gǎn Lǎn Qiú", character: "橄榄球"),
  Word(topic: "Sports", english: "Golf", pinyin: "Gāo'ěr Fū", character: "高尔夫"),

  Word(topic: "Vehicles", english: "Motorbike", pinyin: "Mó Tuō Chē", character: "摩托车"),
  Word(topic: "Vehicles", english: "Train", pinyin: "Huǒ Chē", character: "火车"),
  Word(topic: "Vehicles", english: "Truck", pinyin: "Kǎ Chē", character: "卡车"),
  Word(topic: "Vehicles", english: "Airplane", pinyin: "Fēi Jī", character: "飞机"),

  Word(topic: "Weather", english: "Rain", pinyin: "Xià Yǔ", character: "下雨"),
  Word(topic: "Weather", english: "Sun", pinyin: "Tài Yáng", character: "太阳"),
  Word(topic: "Weather", english: "Cloud", pinyin: "Yún", character: "云"),

];