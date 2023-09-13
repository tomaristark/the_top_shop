import 'package:the_top_shop/constant/String.dart';

class ProductVO{
  String imageURL;
  String name;
  String type;
  int price;

  ProductVO(this.imageURL,this.name,this.type,this.price);
}

List <ProductVO> products =[
  ProductVO(kImage1, "Clothes", "Type", 12),
  ProductVO(kImage2, "Clothes", "Type2", 15),
  ProductVO(kImage3, "Clothes", "E girl", 18),
  ProductVO(kImage1, "Clothes", "Type 4", 20),
  ProductVO(kImage2, "Clothes", "Type 5", 32),
];