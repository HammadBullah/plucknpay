import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define the index for the current page
  int _currentIndex = 0;

  // Define a PageController to handle the page flow
  final PageController _pageController = PageController();

  // List of custom icons
  final List<Widget> _icons = [
    Lottie.asset('assets/icons8-home.json', height: 30, width: 30), // Home Icon
    Image.asset('assets/favorites_icon.png', height: 30, width: 30), // Favorites Icon
    Image.asset('assets/orders_icon.png', height: 30, width: 30), // Orders Icon
    Image.asset('assets/account_icon.png', height: 30, width: 30), // Account Icon
  ];

  // List of page widgets to navigate between
  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Favorites Page')),
    Center(child: Text('Orders Page')),
    Center(child: Text('Account Page'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed Header (Not scrollable)
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu Icon on the left
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white70),
                      onPressed: () {
                        // Handle menu icon tap
                      },
                    ),
                    // Name and Address Section in the middle
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Location", // Replace with dynamic user name
                          style: TextStyle(
                              fontFamily: 'LeagueSpartan',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Bathindi, Jammu", // Replace with dynamic address
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                      ],
                    ),
                    // Cart Icon on the right
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white70),
                      onPressed: () {
                        // Handle cart icon tap
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
                // Search Bar below the Name and Address
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white70),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                        icon: Icon(
                            Icons.search, color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Scrollable Section (Category & Cards)
          Expanded(
            child: SingleChildScrollView( // Only this part is scrollable
              child: Column(
                children: [
                  // Horizontal Scrollable Categories Section
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      height: 40, // Height of the horizontal categories row
                      child: ListView(
                        scrollDirection: Axis.horizontal, // Horizontal scrolling
                        children: List.generate(10, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle category button tap
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'Category ${index + 1}', // Replace with dynamic categories
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  // Grid Section for two cards in a row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: GridView.builder(
                      shrinkWrap: true, // Avoid taking too much space
                      physics: NeverScrollableScrollPhysics(), // Disable internal scroll
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two cards per row
                        crossAxisSpacing: 10, // Spacing between cards
                        mainAxisSpacing: 10, // Spacing between rows
                        childAspectRatio: 0.75, // Aspect ratio of the cards
                      ),
                      itemCount: 6, // Number of cards to display (adjust as needed)
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.category, size: 40, color: Colors.deepOrangeAccent),
                              SizedBox(height: 10),
                              Text(
                                'Card ${index + 1}', // Replace with dynamic content
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Elevated Bottom Navigation Bar with Custom Icons and Flow Navigation
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Navigate to the respective page
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: _icons[0], // Home Icon
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _icons[1], // Favorites Icon
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _icons[2], // Orders Icon
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: _icons[3], // Account Icon
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
