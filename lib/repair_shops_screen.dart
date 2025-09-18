import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:repair_plus_one/profile_screen.dart';
import 'home_screen.dart';
import 'tutorial_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'find_guide_screen.dart'; // ✅ Added import

class RepairShopsScreen extends StatefulWidget {
  const RepairShopsScreen({super.key});

  @override
  State<RepairShopsScreen> createState() => _RepairShopsScreenState();
}

class _RepairShopsScreenState extends State<RepairShopsScreen> {
  int _selectedIndex = 2; // Shops tab active by default

  // ---------------- Filter States ----------------
  String _selectedCategory = "All";
  bool _onlyOpen = false;
  String _sortBy = "Distance";
  String _searchQuery = "";

  // ---------------- Example shops list with coords ----------------
  final List<Map<String, dynamic>> allShops = [
    {
      "name": "Maewa Repair Shop",
      "type": "Phone Repair",
      "distance": "1.2 km away",
      "rating": 4.5,
      "isOpen": true,
      "imagePath": "images/phones/phone1.png",
      "coords": LatLng(7.1907, 125.4553),
    },
    {
      "name": "TechFix Electronics",
      "type": "Laptop Repair • Gaming",
      "distance": "2.1 km away",
      "rating": 4.8,
      "isOpen": false,
      "imagePath": "images/laptop/laptop1.png",
      "coords": LatLng(7.2000, 125.4600),
    },
    {
      "name": "Gadgeteria Gadget Repair Shop",
      "type": "Phone Repair",
      "distance": "3.5 km away",
      "rating": 4.6,
      "isOpen": true,
      "imagePath": "images/phones/phone2.png",
      "coords": LatLng(7.1950, 125.4700),
    },
    {
      "name": "IO Microsystems Computer Repair",
      "type": "Computer Repair",
      "distance": "5.2 km away",
      "rating": 4.2,
      "isOpen": true,
      "imagePath": "images/laptop/laptop2.png",
      "coords": LatLng(7.1850, 125.4500),
    },
  ];

  // ---------------- Filtering ----------------
  List<Map<String, dynamic>> get filteredShops {
    List<Map<String, dynamic>> shops = List.from(allShops);

    if (_searchQuery.isNotEmpty) {
      shops = shops
          .where((shop) => shop["name"]
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (_selectedCategory != "All") {
      shops = shops
          .where((shop) => shop["type"].toString().contains(_selectedCategory))
          .toList();
    }

    if (_onlyOpen) {
      shops = shops.where((shop) => shop["isOpen"] == true).toList();
    }

    if (_sortBy == "Rating") {
      shops.sort(
              (a, b) => (b["rating"] as double).compareTo(a["rating"] as double));
    }

    return shops;
  }

  // ---------------- Bottom Nav ----------------
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TutorialScreen()),
      );
    } else if (index == 2) {
      // already in Shops
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HistoryScreen()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  // ---------------- Filter Bottom Sheet ----------------
  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Filter Shops",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: ["All", "Phone", "Laptop", "Computer"]
                        .map((c) =>
                        DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) {
                      setModalState(() {
                        _selectedCategory = val!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  SwitchListTile(
                    title: const Text("Open now only"),
                    value: _onlyOpen,
                    onChanged: (val) {
                      setModalState(() {
                        _onlyOpen = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: _sortBy,
                    items: ["Distance", "Rating"]
                        .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                    onChanged: (val) {
                      setModalState(() {
                        _sortBy = val!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Sort By",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Apply Filters"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RePair+ Shops"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindGuideScreen()), // ✅ Navigate to FindGuideScreen
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          // Map Section
          SizedBox(
            height: 250,
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(7.1907, 125.4553),
                initialZoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.repair_plus_one',
                ),
                MarkerLayer(
                  markers: allShops.map((shop) {
                    final coords = shop["coords"] as LatLng;
                    return Marker(
                      point: coords,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin,
                          color: Colors.red, size: 35),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search a shop...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _showFilterSheet,
                  icon: const Icon(Icons.filter_list),
                )
              ],
            ),
          ),

          // Shop List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: filteredShops.map((shop) {
                return ShopCard(
                  name: shop["name"],
                  type: shop["type"],
                  distance: shop["distance"],
                  rating: shop["rating"],
                  isOpen: shop["isOpen"],
                  imagePath: shop["imagePath"],
                );
              }).toList(),
            ),
          ),
        ],
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
}

// ---------------- ShopCard ----------------
class ShopCard extends StatelessWidget {
  final String name;
  final String type;
  final String distance;
  final double rating;
  final bool isOpen;
  final String imagePath;

  const ShopCard({
    super.key,
    required this.name,
    required this.type,
    required this.distance,
    required this.rating,
    required this.isOpen,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isOpen ? Colors.green[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isOpen ? "Open" : "Closed",
                          style: TextStyle(
                            color: isOpen ? Colors.green : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange[400], size: 16),
                      const SizedBox(width: 4),
                      Text(rating.toString()),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(type, style: const TextStyle(color: Colors.black54)),
                  Text(distance, style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, size: 18),
                        label: const Text("Call"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.language, size: 18),
                        label: const Text("Website"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.directions, size: 18),
                        label: const Text("Directions"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
