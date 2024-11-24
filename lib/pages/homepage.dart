import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Padding for container
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Name and Address Section with Padding
                Padding(
                  padding: EdgeInsets.only(left: 15), // Padding specific to this section
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe", // Replace with dynamic user name
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "123 Main Street, City", // Replace with dynamic address
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Shopping Bag Icon and Counter (No Padding)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "03", // Replace with dynamic count
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),)
              ],
            ),

          ),



          // Rest of the page content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search products...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  // Promotional Banner
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/healthy-eating-dieting-and-vegetarian-food-concept-assortment-of-superfoods-in-bowls-on-black-background-assortment-of-healthy-food-dishes-top-view-ai-generated-free-photo.jpg'), // Replace with your banner image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),



                  // Categories Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        categoryCard("Fruits", "assets/images/fruits.jpg"),
                        categoryCard("Vegetables", "assets/images/vegetables.jpg"),
                        categoryCard("Dairy", "assets/images/dairy.jpg"),
                        categoryCard("Snacks", "assets/images/snacks.jpg"),
                      ],
                    ),
                  ),

                  // Product Listings
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Top Picks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    padding: EdgeInsets.all(10),
                    itemCount: 6, // Number of products
                    itemBuilder: (context, index) {
                      return productCard(
                        "Apple", // Product name
                        "assets/images/apple.jpg", // Replace with your product image
                        "₹100 / kg", // Price
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Default to Home
        onTap: (index) {
          // Handle navigation between pages
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Category Card Widget
  Widget categoryCard(String name, String imagePath) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Product Card Widget
  Widget productCard(String name, String imagePath, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
