import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PlucknPay', // App title
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Banner
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'), // Replace with your banner image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
