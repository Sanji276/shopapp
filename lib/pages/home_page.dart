import 'package:flutter/material.dart';
import 'package:shopapp/components/bottom_navbar.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/settings_page.dart';
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
    const CartPage(),
    const SettingsPage()
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            color: Theme.of(context).colorScheme.inversePrimary,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                      color: Theme.of(context).colorScheme.inversePrimary,
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
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
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
                  leading: Icon(
                    Icons.shop,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text('Shop',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  onTap: () {
                    navigateToPage(0);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text('Cart',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.pushNamed(context, '/cart');
                    navigateToPage(1);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  onTap: () {
                    navigateToPage(2);
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: Text('Log out',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
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
