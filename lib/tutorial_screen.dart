import 'package:flutter/material.dart';
import 'package:repair_plus_one/profile_screen.dart';

import 'find_guide_screen.dart';
import 'phone_repair_screen.dart';
import 'pc_laptop_repair_screen.dart';
import 'mac_imac_repair_screen.dart';
import 'tablets_ipads_screen.dart';
import 'computer_hardware_repair_screen.dart';
import 'electronic_repair_screen.dart';
import 'repair_shops_screen.dart';
import 'home_screen.dart';
import 'history_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  // Tutorials tab is active by default
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    // if tapped the same tab, do nothing
    if (index == _selectedIndex) return;

    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1: // Tutorials (this screen)
      // we are already here, but keep state consistent
        setState(() {
          _selectedIndex = 1;
        });
        break;
      case 2: // Shops
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RepairShopsScreen()),
        );
        break;
      case 3: // History
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HistoryScreen()),
        );
        break;
      case 4: // History
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }

    // update selected index locally (if navigation didn't replace)
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: const BoxDecoration(color: Color(0xFF10B981)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: const [
                          Icon(Icons.build, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "RePair+",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                        ]),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FindGuideScreen()),
                                );
                              },
                              child: const Icon(Icons.search, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.notifications_none, color: Colors.white),
                            const SizedBox(width: 16),
                            const CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage("images/dash/dash2.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text("Good morning! Ready to repair today?", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Title + Find Guide button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("What do you need to fix?", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("Choose a category to get started", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Grid of categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PhoneRepairScreen())),
                      child: tutorialCategory("images/tutorial/tutorial1.png", "Phones", "Screen, battery, charging port, etc."),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PcLaptopRepairScreen())),
                      child: tutorialCategory("images/tutorial/tutorial2.png", "PC & Laptops", "Keyboard, fan cleaning, thermal paste"),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MacImacRepairScreen())),
                      child: tutorialCategory("images/tutorial/tutorial3.png", "Mac & iMac", "Specialized Apple guides"),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TablestIpadsScreen())),
                      child: tutorialCategory("images/tutorial/tutorial4.png", "Tablets & iPads", "Screen, battery, speakers"),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ComputerHardwareRepairScreen())),
                      child: tutorialCategory("images/tutorial/tutorial5.png", "Computer Hardwares", "Chargers, headphones, smartwatches"),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ElectronicRepairScreen())),
                      child: tutorialCategory("images/tutorial/tutorial6.png", "Electronic Repair", "Miscellaneous gadgets"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Tutorials"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shops"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Category card widget
  Widget tutorialCategory(String img, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img, height: 90, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 6),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}
