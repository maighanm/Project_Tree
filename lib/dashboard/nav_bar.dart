import 'package:assigment_flutter/about%20us/about%20us.dart';
import 'package:assigment_flutter/dashboard/dashboard_screen.dart';
import 'package:assigment_flutter/favorite/favorite_screen.dart';
import 'package:assigment_flutter/profile/profile_page/profile_page.dart';
import 'package:assigment_flutter/quote/quote_screen.dart';
import 'package:assigment_flutter/quote/service.dart';
import 'package:flutter/material.dart';

import '../quote/quote_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          [DashboardScreen(),QuoteScreen(), FavoriteScreen(), AboutUS(), profilePage()][_selectedIndex],

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.format_quote),
            label: "quote",
          ),
          NavigationDestination(icon: Icon(Icons.favorite), label: "favorite"),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            label: "About US",
          ),
          NavigationDestination(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
    );
  }
}
