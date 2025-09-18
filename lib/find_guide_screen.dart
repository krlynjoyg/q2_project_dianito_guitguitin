import 'package:flutter/material.dart';

class FindGuideScreen extends StatelessWidget {
  const FindGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF10B981), // Green
        elevation: 0,
        title: const Text(
          "Find A Guide",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search tutorials...",
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  filterChip("All", true),
                  filterChip("Easy", false),
                  filterChip("Medium", false),
                  filterChip("Advanced", false),
                  filterChip("Newest", false),
                  filterChip("Popular", false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Tutorial List
            Expanded(
              child: ListView(
                children: [
                  tutorialCard(
                    context,
                    "images/tutorial/tutorial1.png",
                    "Phone Screen Replacement",
                    "Fix cracked screens with this step-by-step guide.",
                    "15 min read",
                    "Medium",
                    Colors.orange,
                  ),
                  tutorialCard(
                    context,
                    "images/tutorial/tutorial2.png",
                    "Battery Replacement Guide",
                    "Replace your phone battery to improve performance and life.",
                    "20 min read",
                    "Easy",
                    Colors.green,
                  ),
                  tutorialCard(
                    context,
                    "images/tutorial/tutorial3.png",
                    "Charging Port Repair",
                    "Fix charging issues by replacing damaged ports.",
                    "30 min read",
                    "Advanced",
                    Colors.red,
                  ),
                  tutorialCard(
                    context,
                    "images/tutorial/tutorial4.png",
                    "Battery Replacement Guide",
                    "Fix charging issues by replacing damaged ports.",
                    "30 min read",
                    "Advanced",
                    Colors.red,
                  ),
                  tutorialCard(
                    context,
                    "images/tutorial/tutorial5.png",
                    "Phone Screen Replacement",
                    "Fix charging issues by replacing damaged ports.",
                    "30 min read",
                    "Advanced",
                    Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Tutorials tab active
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // back to home
          } else if (index == 1) {
            // Already here
          }
        },
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

  // ✅ Filter Chip Widget
  Widget filterChip(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF10B981) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ✅ Tutorial Card Widget
  Widget tutorialCard(
      BuildContext context,
      String img,
      String title,
      String subtitle,
      String time,
      String difficulty,
      Color diffColor,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              img,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // ✅ Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(width: 8),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: diffColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        difficulty,
                        style: TextStyle(color: diffColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ✅ Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    // Navigate to tutorial detail
                  },
                  child: const Text("View Tutorial"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
