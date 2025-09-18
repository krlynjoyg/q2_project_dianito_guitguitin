import 'package:flutter/material.dart';

class PcLaptopRepairScreen extends StatelessWidget {
  const PcLaptopRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Top Section
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF10B981),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.laptop, color: Colors.white, size: 40),
                      SizedBox(width: 12),
                      Text(
                        "PC Laptop Repair",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Repair guides and disassembly information for PC laptops of all shapes, sizes, and colors.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("50+ Guides", style: TextStyle(color: Colors.white)),
                      Text("10k+ Repairs", style: TextStyle(color: Colors.white)),
                      Text("95% Success", style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),

            // ✅ Quick Access Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Access",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        quickAccessButton(Icons.search, "Search Guides",
                            backgroundColor: Colors.blue.shade50,
                            iconColor: Colors.blue),
                        quickAccessButton(Icons.bookmark, "Saved",
                            backgroundColor: Colors.green.shade50,
                            iconColor: Colors.green),
                        quickAccessButton(Icons.history, "Recent",
                            backgroundColor: Colors.purple.shade50,
                            iconColor: Colors.purple),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Categories Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "24 Categories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ✅ Categories Grid (Laptops)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.0,
                children: [
                  categoryCard("images/laptop/laptop1.png", "Acer Laptop"),
                  categoryCard("images/laptop/laptop2.png", "Advent Laptop"),
                  categoryCard("images/laptop/laptop3.png", "Aorus Laptop"),
                  categoryCard("images/laptop/laptop4.png", "Asus Laptop"),
                  categoryCard("images/laptop/laptop5.png", "Axioo Laptop"),
                  categoryCard("images/laptop/laptop6.png", "Chromebook"),
                  categoryCard("images/laptop/laptop7.png", "CHUWI Laptop"),
                  categoryCard("images/laptop/laptop8.png", "Clevo Laptop"),
                  categoryCard("images/laptop/laptop9.png", "Compal Laptop"),
                  categoryCard("images/laptop/laptop10.png", "Compaq Laptop"),
                  categoryCard("images/laptop/laptop11.png", "Condor Laptop"),
                  categoryCard("images/laptop/laptop12.png", "CyberPowerPC Laptop"),
                  categoryCard("images/laptop/laptop13.png", "Dell Laptop"),
                  categoryCard("images/laptop/laptop14.png", "Toshiba"),
                  categoryCard("images/laptop/laptop15.png", "Fujitsu Laptop"),
                  categoryCard("images/laptop/laptop16.png", "HP Laptop"),
                  categoryCard("images/laptop/laptop17.png", "Huawei Laptop"),
                  categoryCard("images/laptop/laptop18.png", "Lenovo Laptop"),
                  categoryCard("images/laptop/laptop19.png", "Medion Laptop"),
                  categoryCard("images/laptop/laptop20.png", "MSI Laptop"),
                  categoryCard("images/laptop/laptop21.png", "Sony Laptop"),
                  categoryCard("images/laptop/laptop22.png", "Razer Laptop"),
                  categoryCard("images/laptop/laptop24.png", "Averatec Laptop"),
                  categoryCard("images/laptop/laptop23.png", "Other Laptops"),
                ],
              ),
            ),
            const SizedBox(height: 20),


          // ✅ Featured Tutorials Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Tutorials",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Hot",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

// ✅ Vertical List of Tutorials
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  tutorialCardVertical(
                    title: "How to Install an M.2 SSD",
                    description: "Step-by-step guide to upgrade your laptop storage",
                    imagePath: "images/laptop/f1.png",
                    time: "15 min",
                    difficulty: "Easy",
                    difficultyColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  tutorialCardVertical(
                    title: "Fixing Laptop Fan Noise",
                    description: "Reduce noise and improve cooling performance",
                    imagePath: "images/laptop/f2.png",
                    time: "25 min",
                    difficulty: "Medium",
                    difficultyColor: Colors.amber,
                  ),
                ],
              ),
            ),
            // ✅ Replacement Guides Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Replacement Guides",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  replacementGuideCard(
                    title: "RAM Upgrade/Replacement",
                    description: "Boost your laptop performance",
                    imagePath: "images/laptop/rg.png",
                  ),
                  replacementGuideCard(
                    title: "SSD/HDD Replacement",
                    description: "Upgrade your storage solution",
                    imagePath: "images/laptop/rg1.png",
                  ),
                  replacementGuideCard(
                    title: "Keyboard Replacement",
                    description: "Fix broken or damaged keys",
                    imagePath: "images/laptop/rg2.png",
                  ),
                  replacementGuideCard(
                    title: "Laptop Screen Replacement",
                    description: "Replace cracked or damaged displays",
                    imagePath: "images/laptop/rg3.png",
                  ),
                  replacementGuideCard(
                    title: "Battery Replacement",
                    description: "Replace worn Li-Ion cells",
                    imagePath: "images/laptop/rg4.png",
                  ),
                ],
              ),
            ),
            // ✅ Maintenance & Fixes Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Maintenance & Fixes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  maintenanceCard(
                    title: "Clean Your Laptop",
                    description: "Screen, case & keyboard cleaning",
                    tag: "Featured",
                    tagColor: Colors.blue.shade100,
                    tagTextColor: Colors.blue,
                    time: "10 min",
                    buttonText: "View Tutorial",
                  ),
                  maintenanceCard(
                    title: "Rebuild CMOS Battery",
                    description: "Fix boot and time issues",
                    tag: "Medium",
                    tagColor: Colors.yellow.shade100,
                    tagTextColor: Colors.orange,
                    time: "30 min",
                    buttonText: "View Tutorial",
                  ),
                  maintenanceCard(
                    title: "Apply Thermal Paste",
                    description: "Improve cooling performance",
                    tag: "Hard",
                    tagColor: Colors.red.shade100,
                    tagTextColor: Colors.red,
                    time: "45 min",
                    buttonText: "View Tutorial",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // ✅ Tutorials tab active
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            // Tutorials screen
          } else if (index == 2) {
            // Shops
          } else if (index == 3) {
            // History
          } else if (index == 4) {
            // Profile
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

  // Reusable Quick Access Button
  Widget quickAccessButton(IconData icon, String label,
      {Color backgroundColor = Colors.grey, Color iconColor = Colors.black}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: backgroundColor,
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Reusable Category Card
  Widget categoryCard(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

Widget tutorialCardVertical({
  required String title,
  required String description,
  required String imagePath,
  required String time,
  required String difficulty,
  required Color difficultyColor,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: difficultyColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      difficulty,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: difficultyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget replacementGuideCard({
  required String title,
  required String description,
  required String imagePath,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    ),
  );
}

Widget maintenanceCard({
  required String title,
  required String description,
  required String tag,
  required Color tagColor,
  required Color tagTextColor,
  required String time,
  required String buttonText,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side (text + tags)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: tagTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Right side button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          onPressed: () {},
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}


