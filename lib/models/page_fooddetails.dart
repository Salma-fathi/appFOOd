import 'package:flutter/material.dart';
import 'package:flutter_ahhiii/food.dart';
import 'package:flutter_ahhiii/models/shop.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  final Food food;

  const FoodDetails({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  // quntity
  int quantityCount = 0;
  // decrement
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addCart(widget.food, quantityCount);
      // user khow is succefule
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[300],
          content: const Text(
            "succefully add to cart",
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // removed dialog
                Navigator.pop(context);
                // peviose screen
                Navigator.pop(context);
              },
              icon: Icon(Icons.done),
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
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          // list details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagepath,
                  height: 200,
                ),
                // rate
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //number rat
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[300], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // name food
                Text(
                  widget.food.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // descipstions
                Text(
                  "Descrptions",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Food is a general term that refers to any substance consumed by living organisms to provide nourishment and sustain life",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    height: 2,
                  ),
                )
              ],
            ),
          )),
          Container(
            color: Colors.yellow[300],
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        // decres bottom
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //quantitycount
                        SizedBox(
                          width: 30,
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        // increment

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // add to cart
                ElevatedButton(
                  onPressed: addToCart,
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 128, 128, 128), // Custom shade of grey
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
