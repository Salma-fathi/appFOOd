import 'package:flutter/material.dart';
import 'package:flutter_ahhiii/FoodTil.dart';
import 'package:flutter_ahhiii/models/page_fooddetails.dart';
import 'package:flutter_ahhiii/models/shop.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  void navigateDetailsFood(int index) {
    final Shop shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Shop shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "SheHe",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add your menu button functionality here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
    controller: ScrollController(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(10, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(248, 238, 215, 201),
            borderRadius: BorderRadius.circular(100),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Image.asset(
                "lib/images/7.jpg",
                height: 80,
                width: 100,
                alignment: Alignment.bottomLeft,
              ),
            ],
          ),
        );
      }),
    ),
  ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => foodtil(
                  food: foodMenu[index],
                  onTap: () => navigateDetailsFood(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
