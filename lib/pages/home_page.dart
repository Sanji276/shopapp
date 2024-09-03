import 'package:flutter/material.dart';
import 'package:shopapp/components/bottom_navbar.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),
    //cart page
    const CartPage()
  ];

  //
  int _selectedPageIndex = 0;
  void navigateBottomBar(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //navigate to page
  void navigateToPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Home'),
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'lib/images/applogo.png',
                      color: Colors.white,
                    )),
                //divider
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25),
                //   child: Divider(
                //       //color: Colors.grey,
                //       ),
                // ),

                // other menu
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.pushNamed(context, '/home');
                    navigateToPage(0); // Set index for Home
                    //Navigator.pushNamed(context, '/home');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shop,
                    color: Colors.white,
                  ),
                  title:
                      const Text('Shop', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    navigateToPage(0);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  title:
                      const Text('Cart', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.pushNamed(context, '/cart');
                    navigateToPage(1);
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title:
                  const Text('Log out', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
        selectedIndex: _selectedPageIndex,
        onTabChange: (index) {
          navigateBottomBar(index);
        },
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
