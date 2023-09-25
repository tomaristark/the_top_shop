import 'package:flutter/material.dart';
import 'package:the_top_shop/constant/String.dart';
import 'package:the_top_shop/constant/color.dart';
import 'package:the_top_shop/constant/dimen.dart';
import 'package:the_top_shop/constant/static%20_list.dart';
import 'package:the_top_shop/data/vos/productvo.dart';
import 'package:the_top_shop/pages/confirmation_page.dart';
import 'package:the_top_shop/pages/home_page.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage
({super.key,
required this.productVO
});
final ProductVO  productVO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimayColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,color: kSecondaryColor,size: kProductDetailIconSize,)),
        elevation: 0,
        backgroundColor:kPrimayColor ,
        title:const  Text(
          kDetails,
          style: TextStyle(
            fontSize: kProductDetailTextFS,
            color: kPrimayTextColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP25x),
        child: ListView(
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: kSP20x),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductDetailTab(tabName: kDetails),
                  ProductDetailTab(tabName: kCommnets),
                  ProductDetailTab(tabName: kCompositions),
                  ProductDetailTab(tabName: kOthers),          
                ],
              ),
            ),
           const  Padding(
              padding: const EdgeInsets.only(bottom: kSP20x),
              child: Divider(thickness: kSP2x,),
            ),
           ImageAndPriceView(productImage: productVO.imageURL, hasPriceTag:false,),
         ProductDetailName(productName: productVO.name,),
         ProducrDescriptionText(productDescription: productVO.description,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChooseSizeDropDownSessionView(dropDownName: kChooseSize,toSelectItems: productVO.availableSize),
                ChooseSizeDropDownSessionView(dropDownName: kChooseColor,toSelectItems: productVO.availableColor),
              ],
            ),
          const  Row(
              children: [
                Text(kQuatity),
                Padding(
                  padding: EdgeInsets.only(left: kSP80x),
                  child: Text(kPromoCode),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            QuantityView(productQuantity: productVO.quantity,),
            const PromoCodeView(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: kSP10x),
              child: ButtonWidget(isBlack: true, hasIcon: true, buttonText: kAddToBagText,onTap:(){},),
            ),
            ButtonWidget(isBlack: false, hasIcon: false, buttonText: kGoToConfirmation,onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ConfirmationPage()));
            },)
          ],
        ),
      ),
    );
  }
}

class ProductDetailName extends StatelessWidget {
  const ProductDetailName({
    super.key, required this.productName,
  });
  final String productName;

  @override
  Widget build(BuildContext context) {
    return   Padding(padding:const EdgeInsets.symmetric(vertical: 10),
      child: Text(productName,style: const TextStyle(
        fontSize: kProductNameTextFS,
        fontWeight: FontWeight.w800,
      ),) ,
      );
  }
}

class ProducrDescriptionText extends StatelessWidget {
  const ProducrDescriptionText({
    super.key, required this.productDescription,
  });
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return  Padding(
       padding:const  EdgeInsets.only(bottom: kSP10x),
       child: Text(productDescription,
       style: const TextStyle(
         color: kProductDescriptionColor,
         fontSize: kProductDecriptionTextFS
       ),),
     );
  }
}

class ProductDetailTab extends StatelessWidget {
  const ProductDetailTab({
    super.key, required this.tabName,
  });
final String tabName;
  @override
  Widget build(BuildContext context) {
    return Text(tabName,style:const  TextStyle(
      fontSize: kProductDetailTabFS,
      fontWeight: FontWeight.bold
    ),);
  }
}


class ChooseSizeDropDownSessionView extends StatefulWidget {
  const  ChooseSizeDropDownSessionView({super.key,required this.dropDownName, required this.toSelectItems});
   final String dropDownName;
   final List<String> toSelectItems;
  @override
  State<ChooseSizeDropDownSessionView> createState() => _ChooseSizeDropDownSessionViewState();
}
  
class _ChooseSizeDropDownSessionViewState extends State<ChooseSizeDropDownSessionView> {
  
  String? selectedSize ;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.35,
      height: MediaQuery.of(context).size.height*0.07,
      child: DropdownButtonFormField(
        padding: const EdgeInsets.symmetric(vertical: kSP5x),
        hint: Text(widget.dropDownName,style:const  TextStyle(fontSize: kDropDownFS,fontWeight: FontWeight.bold),),
       icon: const Icon(Icons.expand_more),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSP30x)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSP30x)
          )
        ),
        items: widget.toSelectItems.map((size) => 
      DropdownMenuItem( 
        value : size,
        child :Text(size))).toList() ,
        onChanged: (size) {
          setState(() {
            selectedSize = size;
          });
        }
       ),
    );
  }
}

class QuantityView extends StatefulWidget {
  const QuantityView({super.key,required this.productQuantity});
  final int productQuantity;
  @override
  State<QuantityView> createState() => _QuantityViewState();
  
}


class _QuantityViewState extends State<QuantityView> {
  int itemCount =1;
  

  void _incrementCounter(){
    setState(() {
      if(widget.productQuantity> itemCount){
          itemCount++;
      }
      
    });
  }
  void _decrementCounter(){
       setState(() {
         if(itemCount !=1){
          itemCount--;
         }
       });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*0.28,
      decoration: BoxDecoration(
        border: Border.all(
          color: kSecondaryColor
        ),
        borderRadius: BorderRadius.circular(kSP30x)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP3x),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
            Text(itemCount.toString()),
            IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove))
          ],
        ),
      ),
    );
  }
}

class PromoCodeView extends StatelessWidget {
  const PromoCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.56,
      decoration: BoxDecoration(
        border: Border.all(
          color: kSecondaryColor
        ),
        borderRadius: BorderRadius.circular(kSP30x)
      ),
      child:const Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none
            ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.isBlack, required this.hasIcon, required this.buttonText, required this.onTap});
  
  final bool isBlack;
  final bool hasIcon;
  final String buttonText;
  final Function  onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: ()=> onTap(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.07,
          decoration: BoxDecoration(
            color: (isBlack)?kSecondaryColor:kPrimayColor,
            border: Border.all(
              color: kSecondaryColor
            ),
            borderRadius: BorderRadius.circular(kSP30x)
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                  Padding(
                    padding: EdgeInsets.only(right: kSP10x),
                    child: (hasIcon)?Icon(Icons.work_outline,color: kPrimayColor,):SizedBox.shrink()),
                  Text(buttonText,style: TextStyle(color: (isBlack)?kPrimayColor:kSecondaryColor,fontWeight: FontWeight.bold,fontSize: kButtonTextFS),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}