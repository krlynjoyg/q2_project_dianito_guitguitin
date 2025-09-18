import 'package:flutter/material.dart';
import 'package:repair_plus_one/profile_screen.dart';
import 'tutorial_screen.dart';
import 'repair_shops_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'find_guide_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      // Already on Home, do nothing
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TutorialScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RepairShopsScreen()),
      );
    } else if (index == 3) {
      // ✅ Navigate to History Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HistoryScreen()),
      );
    } else if (index == 4) {
      // ✅ Navigate to History Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }

    setState(() {
      _selectedIndex = index;
    });
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
              // ✅ Header with background color
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981), // Emerald green
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.build, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "RePair+",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
                    const Text(
                      "Good morning! Ready to repair today?",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Featured Tutorials
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured Tutorials",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TutorialScreen()),
                        );
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // ✅ Horizontal scroll of tutorial cards
              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    tutorialCard(
                      context,
                      "How to Replace a Phone Screen",
                      "Save money by doing it yourself",
                      "images/dash/dash1.png",
                    ),
                    tutorialCard(
                      context,
                      "Battery Replacement Guide",
                      "Extend your device's life",
                      "images/dash/dash2.png",
                    ),
                    tutorialCard(
                      context,
                      "Laptop Overheating Fix",
                      "Cool down your laptop efficiently",
                      "images/dash/dash3.png",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Nearby Repair Shops
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nearby Repair Shops",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RepairShopsScreen()),
                        );
                      },
                      child: Text("View on Map",
                          style: TextStyle(color: Colors.green.shade700)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    shopCard(
                      "TechFix Center",
                      "⭐ 4.7 | 1.2 km",
                      "Phones · Laptops · Accessories",
                    ),
                    const SizedBox(height: 14),
                    shopCard(
                      "GreenTech Repair Hub",
                      "⭐ 4.9 | 0.8 km",
                      "Phones · Tablets · Gadgets",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Eco-Friendly Tips
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Eco-Friendly Tips",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ecoTipCard(
                      icon: Icons.eco,
                      iconColor: Colors.green,
                      title: "Did you know?",
                      description:
                      "Repairing a laptop fan saves up to ₱3,000 and prevents overheating damage.",
                    ),
                    const SizedBox(height: 14),
                    ecoTipCard(
                      icon: Icons.recycling,
                      iconColor: Colors.blue,
                      title: "Impact Fact",
                      description:
                      "One repaired phone prevents 55kg of e-waste from polluting our environment.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Eco Impact
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Your Eco Impact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ecoImpactCard(),
              ),

              const SizedBox(height: 28),

              // Community
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Community Highlights",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    communityCard(
                      title: "Success Story",
                      description:
                      "Maria repaired her tablet using DIY tutorial – saved ₱4,500!",
                      badge: "Eco-Saver",
                      badgeColor: Colors.green.shade100,
                    ),
                    const SizedBox(height: 14),
                    communityCard(
                      title: "Shop Highlight",
                      description: "GreenTech Repair Hub helped 200+ users this month!",
                      linkText: "Share Your Story",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
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

// ------------------- Widgets -------------------

  Widget tutorialCard(
      BuildContext context, String title, String subtitle, String imgAsset) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imgAsset,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TutorialScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(34),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      "Find a Guide",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget shopCard(String name, String rating, String category) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(rating, style: const TextStyle(color: Colors.amber)),
              const SizedBox(height: 2),
              Text(category,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RepairShopsScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Visit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ecoTipCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: iconColor.withOpacity(0.05),
        border: Border.all(color: iconColor.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(color: Colors.black87, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ecoImpactCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green.shade50,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.green,
                    child: Text("2",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 6),
                  Text("Devices Saved",
                      style: TextStyle(color: Colors.black87, fontSize: 12)),
                ],
              ),
              Column(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue,
                    child: Text("10",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 6),
                  Text("kg E-waste Avoided",
                      style: TextStyle(color: Colors.black87, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(
            value: 0.7,
            color: Colors.green,
            backgroundColor: Colors.grey.shade300,
            minHeight: 6,
            borderRadius: BorderRadius.circular(6),
          ),
          const SizedBox(height: 8),
          const Text(
            "Keep going! Try one more repair to reach your monthly goal.",
            style: TextStyle(color: Colors.black54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget communityCard({
    required String title,
    required String description,
    String? badge,
    Color? badgeColor,
    String? linkText,
  }) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          Text(description, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          if (badge != null)
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor ?? Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(badge,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500)),
            ),
          if (linkText != null)
            Text(
              linkText,
              style: const TextStyle(color: Colors.green, fontSize: 13),
            ),
        ],
      ),
    );
  }
}
