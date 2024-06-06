import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restro_ui_template/model/MenuItem.dart';
import 'package:restro_ui_template/repository/ItemsData.dart';

class SearchFoodScreen extends StatefulWidget {
  @override
  _SearchFoodScreenState createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  final List<MenuItem> foodItems = DataItems().getFoodItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              SizedBox(height: 16),
              _buildSearchBar(),
              SizedBox(height: 20),
              Expanded(
                child: _buildStaggeredGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            elevation: 5,
            color: Colors.grey.shade50,
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 2, top: 6, bottom: 6),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ))),
        const Text(
          'Search Food',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile_picture.png'),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Spice Food',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10),
        Card(
          elevation: 5,
          child: Container(
            height: 55,
            width: 55,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.list_alt,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStaggeredGridView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: foodItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = foodItems[index];
        return (item.resultCount != -1)
            ? _buildResultWidget(item.resultCount)
            : _buildFoodItem(item.title!, item.subtitle!, item.calories!,
                item.price!, item.image!);
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      // Each item takes 2 columns and adjusts height
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  Widget _buildResultWidget(int results) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Found \n${results} results',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFoodItem(
      String title, String subtitle, int calories, double price, String image) {
    return Container(
      margin: EdgeInsets.only(top: 45),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  //transform: GradientRotation(70),
                  colors: [
                    Colors.white.withOpacity(1),
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40), // Space for the image
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          "$calories Calories",
                          style: const TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '\$ ',
                              style: TextStyle(
                                fontSize: 12, // Decrease the font size
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text: price.toString(),
                              // Assuming price is a variable holding the price value
                              style: const TextStyle(
                                fontSize: 20, // Increase the font size
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Change the color to black
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -40, // Adjust as necessary to have 25% of the image outside
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              // Adjust the radius as necessary
              backgroundColor: Colors.white,
              // Optional: Background color for the CircleAvatar
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  image,
                  height: 95,
                  width: 95,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
