import '../model/MenuItem.dart';

class DataItems {
  final List<MenuItem> foodItems = [
    MenuItem.Result(resultCount: 11),
    MenuItem(title: 'Oni Sandwich', subtitle: 'Spicy chicken sandwich', calories: 69, price: 6.72, image: 'assets/images/oni_sandwich.png'),
    MenuItem(title: 'Dan Noodles', subtitle: 'Spicy fruit mixed', calories: 120, price: 8.86, image: 'assets/images/dan_noodles.png'),
    MenuItem(title: 'Chicken Dimsum', subtitle: 'Spicy chicken dimsum', calories: 65, price: 6.99, image: 'assets/images/chicken_dimsum.png'),
    MenuItem(title: 'Egg Pasta', subtitle: 'Spicy chicken pasta', calories: 78, price: 9.80, image: 'assets/images/egg_pasta.png'),
    MenuItem(title: 'Yemeny Biryani', subtitle: ' Hot Spicy Biryani With Roasted Chicken', calories: 100, price: 10.72, image: 'assets/images/biryani.png'),
    MenuItem(title: 'Egg Ramen', subtitle: 'Spicy chicken Ramen', calories: 98, price: 7.99, image: 'assets/images/Ramen.png'),
    MenuItem(title: 'Tapas Prawn', subtitle: 'Spicy Sea Food', calories: 84, price: 11.80, image: 'assets/images/tapas.png'),
    MenuItem(title: 'Chicken Pasta', subtitle: ' Hot Spicy Chicken Pasta', calories: 120, price: 5.72, image: 'assets/images/chicken_pasta.png'),
    MenuItem(title: 'Oni Sandwich', subtitle: 'Spicy chicken sandwich', calories: 69, price: 6.72, image: 'assets/images/oni_sandwich.png'),
    MenuItem(title: 'Dan Noodles', subtitle: 'Spicy fruit mixed', calories: 120, price: 8.86, image: 'assets/images/dan_noodles.png'),
    MenuItem(title: 'Yemeny Biryani', subtitle: ' Hot Spicy Biryani With Roasted Chicken', calories: 100, price: 10.72, image: 'assets/images/biryani.png'),
  ];

  List<MenuItem> getFoodItems() {
    return List<MenuItem>.from(foodItems);
  }

  void addFoodItem(MenuItem newItem) {
    foodItems.add(newItem);
  }
}
