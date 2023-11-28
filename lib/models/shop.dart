import 'package:flutter/widgets.dart';
import '../food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Meat",
      price: "5.000",
      imagepath: "lib/images/5.jpg",
      rating: "4.5",
    ),
    Food(
      name: "Pizza",
      price: "9.000",
      imagepath: "lib/images/6.jpg",
      rating: "4.9",
    ),
    Food(
      name: "Pizza hete",
      price: "8.000",
      imagepath: "lib/images/8.jpg",
      rating: "9.5",
    ),
  ];
// custmer cart
  final List<Food> _cart = [];
  //getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // addcart
  void addCart(Food foodItme, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItme);
    }
    notifyListeners();
  }

  //removedcar
  void removedFromcart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  void clearCart() {}
}
