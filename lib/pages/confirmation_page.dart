
import 'package:flutter/material.dart';
import 'package:the_top_shop/constant/String.dart';
import 'package:the_top_shop/constant/color.dart';
import 'package:the_top_shop/constant/dimen.dart';
import 'package:the_top_shop/pages/product_detail_page.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimayColor,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon(Icons.arrow_back,size: kBackArrowIconSize35x,color: kSecondaryColor,)),
        centerTitle: true,
        title: const Text(kConfirmationText,style: TextStyle(color: kPrimayColor,fontSize: kConfimationFS,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP25x),
        child: ListView(
          children: [
           const ConfirmationHeadingText(headText: kShoppingBagText,),
           const  Padding(padding: EdgeInsets.symmetric(vertical: kSP10x),
            child: Wrap(
              children: [
                BuyItemListView(),
                BuyItemListView(),
              ],
            ),),
           const Divider(thickness: 2,),
          const  ConfirmationHeadingText(headText: kCreditCardText),
          const  Padding(
              padding: EdgeInsets.symmetric(vertical: kSP2x),
              child: Text(kCardHolderName),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kSecondaryColor
                ),
                borderRadius: BorderRadius.circular(kSP30x)
              ) ,
            ),
             const  Padding(
                padding: const EdgeInsets.symmetric(vertical: kSP10x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSP2x),
                    child: Text(kCardNumber,textAlign: TextAlign.left,),
                    ),
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSP2x,horizontal: kSP10x),
                    child: Text(kExpDate,textAlign: TextAlign.right,),
                          ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(kSP30x)
              ) ,
            ),
              Container(
              width: MediaQuery.of(context).size.width*0.2,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(kSP30x)
              ) ,
            ),
                ],
              ),
              const  Padding(
                padding: const EdgeInsets.symmetric(vertical: kSP10x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSP2x),
                    child: Text(kCVV,textAlign: TextAlign.left,),
                    ),
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSP2x,horizontal: kSP10x),
                    child: Text(kCountry,textAlign: TextAlign.right,),
                          ),
                  ],
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
              width: MediaQuery.of(context).size.width*0.2,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(kSP30x)
              ) ,
            ),
              Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(kSP30x)
              ) ,
            ),
                ],
              ),
            const   Padding(
                padding: const EdgeInsets.symmetric(vertical: kSP15x),
                child: Divider(thickness: kSP2x,),
              ),
          const Padding(
              padding: const EdgeInsets.only(bottom: kSP20x),
              child: ConfirmationHeadingText(headText: kPaymentInformation),
            ),
            const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(kSubTotal,style: TextStyle(fontWeight: FontWeight.w500,fontSize: kConfirmationDeatailTextFS),),
              Text("\$28",style: TextStyle(fontWeight: FontWeight.w500,fontSize: kConfirmationDeatailTextFS),)
            ],),
           const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(kDelivery,style: TextStyle(fontWeight: FontWeight.w500,fontSize: kConfirmationDeatailTextFS),),
                Text("\$28",style: TextStyle(fontWeight: FontWeight.w500,fontSize: kConfirmationDeatailTextFS),)
              ],),
            ),
          const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(kTotal,style: TextStyle(fontWeight: FontWeight.w900,fontSize: kConfirmationDeatailTextFS),),
              Text("\$28",style: TextStyle(fontWeight: FontWeight.w900,fontSize: kConfirmationDeatailTextFS),)
            ],),
            Padding(
              padding: const EdgeInsets.only(top: kSP20x),
              child: ButtonWidget(isBlack: true, hasIcon: false, buttonText: kConfirmOrder, onTap: (){}),
            )
            ],
          )
        ),
    );
  }
}

class BuyItemListView extends StatelessWidget {
  const BuyItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Sleeves T-shirt",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Row(
            children: [
              Text("\$12",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                    child: Container(
                      width: kSP20x,
                      height: kSP20x,
                      decoration:const  BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCancelButtonColor
                      ),
                      child:const  Center(
                        child: Icon(Icons.close,size: 12,)
                        ),
                    ),
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}

class ConfirmationHeadingText extends StatelessWidget {
  const ConfirmationHeadingText({
    super.key, required this.headText,
  });
  final String  headText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSP10x),
      child: Text(headText,style: const TextStyle(
        color: kPrimayTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 28
      ),),
    );
  }
}