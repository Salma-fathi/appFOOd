import 'package:flutter/material.dart';
import 'package:flutter_ahhiii/food.dart';

class foodtil extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const foodtil({Key? key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: const Alignment(-2.0, -3.0),
        margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image
            const SizedBox(),
            Image.asset(
              food.imagepath,
              height: 200,
              width: 200,
            ),
            // text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // price+ rating
                Text('\$${food.price}'),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      food.rating,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
                // rating
              ],
            ),
          ],
        ),
      ),
    );
  }
}
