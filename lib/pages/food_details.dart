import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shushi_app/components/button.dart';
import 'package:shushi_app/models/shop.dart';
import 'package:shushi_app/themes/colors.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text("Successfully added to cart", style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),color: Colors.white,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Image.asset(widget.food.imagePath, height: 200),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      const SizedBox(width: 10),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(widget.food.name, style: TextStyle(fontSize: 28)),
                  const SizedBox(height: 25),
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Salmon sushi typically features a slice of raw salmon atop a bed of seasoned sushi rice. It's often enjoyed with wasabi and soy sauce, or with salt and a touch of citrus. Salmon nigiri (hand-pressed rice with salmon) is a common presentation, but salmon sushi can also be found in rolls, like the popular salmon and avocado roll. The salmon's rich, slightly oily flavor is a key component, and fresh, high-quality salmon is essential for the best experience. ",
                    style: TextStyle(
                      height: 2,
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                MyButton(text: "Add to cart", onTap: () => addToCart()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
