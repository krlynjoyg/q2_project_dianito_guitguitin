import 'package:flutter/material.dart';

class IPhoneBatteryDrainScreen extends StatelessWidget {
  const IPhoneBatteryDrainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery Drain Troubleshooting"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "iPhone Battery Drain Troubleshooting",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // ✅ Author Info
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/dash/dash2.png"),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Alisha C and 6 contributors",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text("Last updated on March 18, 2025",
                          style: TextStyle(
                              fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1),

            // ✅ Causes Section
            const Text("Causes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Column(
              children: [
                _causeItem(context, 1, "Heavy Use", _heavyUseContent),
                _causeItem(context, 2, "Buggy Software", _buggySoftwareContent),
                _causeItem(context, 3, "Low Cell Service", _lowCellServiceContent),
                _causeItem(context, 4, "Extreme Temperatures", _extremeTempContent),
                _causeItem(context, 5, "Faulty Battery", _faultyBatteryContent),
                _causeItem(context, 6, "Charging Port Damage", _chargingPortContent),
                _causeItem(context, 7, "Tristar Malfunction", _tristarContent),
                _causeItem(context, 8, "Logic Board Fault", _logicBoardContent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Cause Item with Navigation
  static Widget _causeItem(
      BuildContext context, int number, String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.blue,
          child: Text(
            number.toString(),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CauseDetailScreen(
                number: number,
                title: title,
                content: content,
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 Content Strings (You can expand each with the full texts you provided)
  static const String _heavyUseContent = """
Advertised battery life and battery life in practice often vary wildly. Just because the specs page on your brand new iPhone 13 Pro Max boasts up to 95 hours of audio playback, doesn’t mean you'll get four whole days of use on a single charge. These numbers are acquired in precisely controlled and idealized scenarios. Here are some ways to minimize your phone's energy consumption.

• Check to see what is using your battery. Navigate to Settings > Battery. Underneath the battery health indicator is a breakdown of what is sucking down power. Limit use of apps that consume lots of energy, or come to terms with their impact on battery life.

    ◦ Turn off background app refresh for all apps, or apps you don’t need real time notifications from. This can be toggled off for all or individual apps under Settings > General > Background App Refresh.

• If you tend to get a lot of notifications, disabling vibrations can significantly improve battery life.

• Decrease your screen lock time out. Or be sure to lock your phone when you’re done using it.

• Enable Do Not Disturb (or Focus) mode. Otherwise incoming notifications will power the screen on as they come in. Bear in mind you may need to configure exceptions if you don't want to risk missing important calls.

• GPS, video games, streaming media, and frequent use of the camera flash will also consume higher than typical amounts of energy and could shorten battery life.
""";

  static const String _buggySoftwareContent =
      "Poorly optimized or buggy software can be a battery killer... (full text here)";
  static const String _lowCellServiceContent =
      "When your phone is in an area where cellular coverage is limited... (full text here)";
  static const String _extremeTempContent =
      "Batteries don’t like extreme temperatures on either end... (full text here)";
  static const String _faultyBatteryContent =
      "We are likely all aware that all rechargeable batteries degrade over time... (full text here)";
  static const String _chargingPortContent =
      "Although charging issues are more commonly related to the Lightning port... (full text here)";
  static const String _tristarContent =
      "The Tristar chip (or Hydra in iPhone 8 and newer)... (full text here)";
  static const String _logicBoardContent =
      "The logic board is the hub for the vast majority of an iPhone's functionality... (full text here)";
}

// 🔹 Detailed Cause Screen
class CauseDetailScreen extends StatelessWidget {
  final int number;
  final String title;
  final String content;

  const CauseDetailScreen(
      {Key? key, required this.number, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$number $title"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          content,
          style: const TextStyle(fontSize: 15, height: 1.5),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
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
}
