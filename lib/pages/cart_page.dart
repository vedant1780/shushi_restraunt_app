import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shushi_app/components/button.dart';
import 'package:shushi_app/themes/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(Food food,BuildContext context){
    final shop=context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context,value,child)=>
       Scaffold(backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Cart", style: TextStyle(color: Colors.white)),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount:value.cart.length,itemBuilder: (context, index) {
                final Food food=value.cart[index];
                final String foodName=food.name;
                final String foodPrice=food.price;
                return Container(decoration: BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                  child: ListTile(
                    title: Text(foodName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text(foodPrice,style: TextStyle(color: Colors.grey[300]),),
                    trailing: IconButton(icon: Icon(Icons.delete),onPressed: ()=>removeFromCart(food,context)),

                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay Now", onTap: (){}),
            )
          ],
        ),
      ),
    );
  }
}
