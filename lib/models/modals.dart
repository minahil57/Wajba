class menu {

  final String item;
  final String detail1;
  final String price;
  final String image;
  final String detail2;


  menu({
    required this.item,
    required this.detail1,
    required this.detail2,
    required this.price,
    required this.image,
  });
}
class popular extends menu{
  popular({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class details_discounts extends menu{
  details_discounts({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class starters extends menu{
  starters({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class pakistani_food extends menu{
  pakistani_food({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class chinese extends menu{
  chinese({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class salad extends menu{
  salad({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}
class baverages extends menu{
  baverages({required super.item, required super.detail1, required super.detail2, required super.price, required super.image});

}