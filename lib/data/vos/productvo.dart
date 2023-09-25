import 'package:the_top_shop/constant/String.dart';

class ProductVO{
  String imageURL;
  String name;
  String description;
  String type;
  int price;
  List<String> availableSize;
  List<String>availableColor;
  int quantity;

  ProductVO(this.imageURL,this.name,this.type,this.price,this.description,this.availableColor,this.availableSize,this.quantity);
}

List <ProductVO> products =[
  ProductVO(kImage1, "Clothes", "Type", 12,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",["Red","Blue","Gray"],["S","M","L",],10),
  ProductVO(kImage2, "Clothes", "Type2", 15,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",["Red","Blue","Gray","White","Purple"],["L","Xl","2XL","3XL"],5),
  ProductVO(kImage3, "Clothes", "E girl", 18,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",["Gray","White","Purple"],["S","M","L","Xl"],12),
  ProductVO(kImage1, "Clothes", "Type 4", 20,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",["Red","Blue",],["S","2XL","3XL"],11),
  ProductVO(kImage2, "Clothes", "Type 5", 32,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",["Red","Blue","White","Purple"],["S","M","L","3XL"],20),
];