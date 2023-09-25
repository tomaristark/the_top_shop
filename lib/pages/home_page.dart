
import 'package:flutter/material.dart';
import 'package:the_top_shop/constant/String.dart';
import 'package:the_top_shop/constant/color.dart';
import 'package:the_top_shop/data/vos/productvo.dart';
import 'package:the_top_shop/pages/product_detail_page.dart';
import '../constant/dimen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: kSP25x),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShopNameAndShoppingCartSessionView(),
            SearchBarSessionView(),
            FilterSelectSessionView(),
            FilterSessionView(),
            Divider(thickness: 2,),
            ProductListSessionView()
          ],
        ),
      ),
    );
  }
}

class ProductListSessionView extends StatelessWidget {
  const ProductListSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (context,index){
            final productVO = products[index];
           return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context )=> ProductDetailPage(productVO: productVO,)));
                  },
                  child: ImageAndPriceView(
                      productImage: productVO.imageURL,
                      productPrice: productVO.price,
                  ),
                ),
                SizedBox(          
                  height: MediaQuery.of(context).size.height*0.08,
                  child: ProductAndStyleTypeView(
                    productName: productVO.name,
                    productType: productVO.type,
                  ),
                )
            ],
           );
          },
          separatorBuilder: (context,index){
            return const Divider(thickness: 2,);
          },
        ),
      ),
    );
  }
}

class ImageAndPriceView extends StatelessWidget {
  const ImageAndPriceView({
    super.key, required this.productImage, this.productPrice ,this.hasPriceTag =true
  });
  final String productImage ;
  final int ?  productPrice;
  final bool hasPriceTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.28,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kSP20x),
            child: Image.network(productImage,fit: BoxFit.fill,)),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: kSP10x,right: kSP10x),
              child:(hasPriceTag)? Container(
                width: kPriceWidth,
                height: kPriceHeight,
                decoration: BoxDecoration(
                  color: priceColor,
                  borderRadius: BorderRadius.circular(kSP20x)
                ),
                child: Center(
                  child: Text("\$ $productPrice"),
                ),
              ):null,
            ))
        ],
      ),
    );
  }
}

class ProductAndStyleTypeView extends StatelessWidget {
  const ProductAndStyleTypeView({
    super.key, required this.productName, required this.productType,
  });
  final String productName;
  final String productType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName,style: const TextStyle(
              fontSize: kProductNameFS,
              fontWeight: FontWeight.bold
            ),),
            Text(productType,style: const TextStyle(
              fontSize: kProductTypeFS,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
        const AddToBagView()
      ],
    );
  }
}

class AddToBagView extends StatelessWidget {
  const AddToBagView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.35,
      decoration: BoxDecoration(
        color: addToBagButtonColor,
        borderRadius: BorderRadius.circular(kSP20x)
      ),
      child:const  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: kSP5x),
            child: Icon(Icons.work_outline,color: addToBagIconAndTextColor,),
          ),
          Text(kAddToBagText,style: TextStyle(
            color: addToBagIconAndTextColor,
            fontWeight: FontWeight.w600
          ),)
        ],
      ),
    );
  }
}

class FilterSessionView extends StatelessWidget {
  const FilterSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(bottom: kSP10x),
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: [
          Text(kFiltersText,style: TextStyle(
            fontSize: kFilterTextFS,
            fontWeight: FontWeight.bold
          ),),
         SelectedFilterItemView(selectedFilter: "T-Shirt",),
         SelectedFilterItemView(selectedFilter: "casual",),
         SelectedFilterItemView(selectedFilter: "T-Shirt",),
         SelectedFilterItemView(selectedFilter: "T-Shirt",),
        ],
      ),
    );
  }
}

class SelectedFilterItemView extends StatelessWidget {
  const SelectedFilterItemView({
    super.key, required this.selectedFilter,
  });
  final String selectedFilter ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(selectedFilter,style: TextStyle(
           color: Colors.grey[700],
           fontSize: kSelectedFilterTextFS,
          
         ),),
         Padding(
           padding: const EdgeInsets.only(left: kSP5x),
           child: Container(
             width: kSelectedFilterRemoveButtonWidth,
             height: kSelectedFilterRemoveButtonHeight,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.grey[400]
             ),
             child: const Icon(Icons.close,size: kSelectedFilterRemoveButtonIconSize,),
           ),
         )
       ],
      ),
    );
  }
}

class ShopNameAndShoppingCartSessionView extends StatelessWidget {
  const ShopNameAndShoppingCartSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(
        top:kSP30x,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShopNameView(),
            ShoppingCartView()
          ]),
    );
  }
}

class FilterSelectSessionView extends StatelessWidget {
  const FilterSelectSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: kSP20x,bottom: kSP10x),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterDropDownView(filterOption:kSortBy),
          FilterDropDownView(filterOption:kProduct),
          FilterDropDownView(filterOption:kStyle),
          FilterDropDownView(filterOption:kSize),

      ],),
    );
  }
}

class FilterDropDownView extends StatelessWidget {
  const FilterDropDownView({
    super.key, required this.filterOption,
  });
  final String filterOption ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kFilterDropDownButtonHeight,
      child: Row(
        children: [
          Text(filterOption,style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: kFilterHintTextFS
          ),),
          const Icon(Icons.expand_more)
        ],
      ),
    );
  }
}

class SearchBarSessionView extends StatelessWidget {
  const SearchBarSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kSearchBarHeight,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(kSP20x)
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search,size: kSearchIconSize,color:kSearchBarIconAndHintTextColor,),
          ),
          Text("Search your product",style: TextStyle(
            color: kSearchBarIconAndHintTextColor
          ),
          )
        ],
      ),
    );
  }
}

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       const  SizedBox(
            width: kShoppinCartWidth,
            height: kShoppinCartHeight,
            child: Icon(
              Icons.shopping_basket_outlined,
              size: kShoppinCartIconSize,
            )),
        Positioned(
            bottom: kSP53x,
            right: kSP20x,
            child: (Container(
              width: kSP20x,
              height: kSP20x,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )))
      ],
    );
  }
}

class ShopNameView extends StatelessWidget {
  const ShopNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      kShopName,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: kShopNameFS),
    );
  }
}
