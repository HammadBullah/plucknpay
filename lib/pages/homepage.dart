import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plucknpay/pages/themedata.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  late List<Widget> _icons;
  int _selectedCategoryIndex = -1;

  // List of category names
  final List<String> categoryNames = [
    'Fruits',
    'Vegetables',
    'Snacks',
  ];

  @override
  void initState() {
    super.initState();

    _icons = [
      GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = 0;
            _pageController.jumpToPage(0);
          });
        },
        child: SvgPicture.asset(
          'assets/icons8-home-2.svg',
          height: 30,
          width: 30,
          color: Colors.black,
        ),
      ),
      GestureDetector(
        onTap: () {
          print("Favorites Page Link");
        },
        child: Image.asset('assets/icons8-favorite-90.png', height: 30, width: 30),
      ),
      GestureDetector(
        onTap: () {
          print("Orders Page Link");
        },
        child: Image.asset('assets/icons8-parcel-96.png', height: 30, width: 30),
      ),
      GestureDetector(
        onTap: () {
          print("Account Page Link");
        },
        child: Image.asset('assets/icons8-user-96.png', height: 30, width: 30),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = platformBrightness == Brightness.dark;

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/black.png'),  // Replace with your image path
                  fit: BoxFit.cover,  // Adjust the image size to cover the container
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white70),
                        onPressed: () {},
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontFamily: 'LeagueSpartan',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Bathindi, Jammu",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'LeagueSpartan',
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white70),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
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
                          icon: Icon(Icons.search, color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                height: 150,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double buttonWidth = constraints.maxWidth / categoryNames.length;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryNames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: buttonWidth - 20,  // Subtract padding to ensure buttons fit the screen
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedCategoryIndex = index;  // Update selected category
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                categoryNames[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategoryIndex = 0;  // Update selected category
                                  });
                                },
                                child: Text(
                                  'TOP PICKS',
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                    color: isDarkMode == true && _selectedCategoryIndex == 0
                                        ? Colors.deepOrangeAccent  // Highlight color when selected
                                        : Colors.black.withOpacity(0.7),// Default color
                                  ),
                                ),
                              ),
                            ),
                            Divider(height: 10,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategoryIndex = 1;  // Set the selected category index to 1 (Trending)
                                  });
                                },
                                child: Text(
                                  'TRENDING',
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                    color: _selectedCategoryIndex == 1
                                        ? Colors.deepOrangeAccent  // Highlight color when selected
                                        : Colors.black.withOpacity(0.7),  // Default color
                                  ),
                                ),
                              ),
                            ),
                            Divider(height: 10,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategoryIndex = 2;  // Set the selected category index to 2 (New Arrivals)
                                  });
                                },
                                child: Text(
                                  'NEW ARRIVALS',
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                    color: _selectedCategoryIndex == 2
                                        ? Colors.deepOrangeAccent  // Highlight color when selected
                                        : Colors.black.withOpacity(0.7),  // Default color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: 6,
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
                                  'Card ${index + 1}',
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
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.deepOrangeAccent,  // Keep the background white for both themes
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            selectedItemColor: Colors.deepOrangeAccent,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: _icons[0],
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _icons[1],
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: _icons[2],
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: _icons[3],
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
