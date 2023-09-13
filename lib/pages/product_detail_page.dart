import 'package:flutter/material.dart';
import 'package:the_top_shop/constant/color.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimayColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:kPrimayColor ,
        title: Text(
          "Detail",
          style: TextStyle(
            fontSize: 20,
            color: kPrimayTextColor
          ),
        ),
        
      ),
    );
  }
}