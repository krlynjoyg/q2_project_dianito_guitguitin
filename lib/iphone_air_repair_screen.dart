import 'package:flutter/material.dart';
import 'view/apple_air/iphone_battery_drain_screen.dart';

class IPhoneAirRepairScreen extends StatelessWidget {
  const IPhoneAirRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("iPhone Air Repair"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Navigate to search screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Top Banner
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF10B981),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.phone_android, color: Colors.white, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Apple iPhone Air",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Repair guides, troubleshooting tips, and specifications for the Apple iPhone Air.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            // ✅ Table of Contents
            ExpansionTile(
              title: const Text(
                "Table of Contents",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const [
                ListTile(title: Text("Troubleshooting")),
                ListTile(title: Text("Background")),
                ListTile(title: Text("Identification")),
                ListTile(title: Text("Technical Specifications")),
                ListTile(title: Text("Additional Information")),
                ListTile(title: Text("Author")),
              ],
            ),
            const SizedBox(height: 20),

            // ✅ Troubleshooting
            sectionTitle("Troubleshooting"),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IPhoneBatteryDrainScreen())),
                child: troubleshootingCard(
                    "iPhone Battery Draining Fast", "images/apple/iphone_air/air1.png"),
                ),
                troubleshootingCard(
                    "iPhone is Charging but Won’t Turn On", "images/apple/iphone_air/air2.png"),
                troubleshootingCard(
                    "iPhone Not Charging", "images/apple/iphone_air/air3.png"),
                troubleshootingCard(
                    "iPhone Lines on Screen", "images/apple/iphone_air/air4.png"),
                troubleshootingCard(
                    "iPhone Keeps Restarting", "images/apple/iphone_air/air5.png"),
                troubleshootingCard(
                    "iPhone Randomly Shuts Off", "images/apple/iphone_air/air6.png"),
              ],
            ),
            const SizedBox(height: 20),

            // ✅ Background
            sectionTitle("Background"),
            sectionText(
                "The iPhone Air was announced on September 9, 2025. It introduced a lightweight design with improved display technology and efficiency."),
            const SizedBox(height: 20),

            // ✅ Identification
            sectionTitle("Identification"),
            buildIdentificationSection(),
            const SizedBox(height: 20),

            // ✅ Technical Specs
            sectionTitle("Technical Specifications"),
            sectionText(
              "Dimensions: 156.2 x 74.7 x 5.64 mm (6.15 x 2.94 x 0.22 in)\n"
                  "Weight: 165 g (5.82 oz)\n"
                  "Water Resistance: IP68\n"
                  "Colors: Space Black, Cloud White, Light Gold, and Sky Blue\n\n"
                  "Operating System: iOS 26\n\n"
                  "Processor: A19 Pro Chip\n"
                  " - 6-core CPU with 2 performance and 4 efficiency cores\n"
                  " - 5-core GPU\n"
                  " - 16-core Neural Engine\n"
                  "RAM: Unknown\n"
                  "Storage: 256 GB, 512 GB, or 1 TB\n\n"
                  "Battery: 4006 mAh, up to 27 hours of video playback\n"
                  "Ports: 1x USB Type-C charge port (USB 2, up to 480 Mb/s)\n\n"
                  "Display:\n"
                  " - 6.5 inch “Super Retina XDR” OLED\n"
                  " - 2736 × 1260 resolution (460 ppi)\n"
                  " - ProMotion 1-120 Hz\n"
                  " - Ceramic Shield 2, Multi-touch, Haptic Touch\n"
                  " - 2,000,000:1 contrast ratio\n"
                  " - True Tone, P3 wide color\n"
                  " - Brightness: 1000 nits max, 1600 nits HDR peak, 3000 nits outdoor peak, 1 nit min\n"
                  " - Fingerprint-resistant oleophobic coating\n"
                  " - Dynamic Island\n\n"
                  "Rear 'Fusion' Camera:\n"
                  " - 48 MP wide, 12 MP 2x optical telephoto\n"
                  " - 26 mm, ƒ/1.6 aperture\n"
                  " - Sensor-shift OIS\n"
                  " - 4K 60 fps video, slo-mo 1080p 240 fps\n\n"
                  "TrueDepth Selfie Camera with Face ID:\n"
                  " - 18 MP, ƒ/1.9 aperture\n"
                  " - 4K 60 fps video, Dolby Vision\n"
                  " - Supports Night Mode, Dual Capture, Center Stage\n\n"
                  "Sensors:\n"
                  " - Face ID, Barometer, High dynamic range gyro\n"
                  " - High-G accelerometer (Crash Detection)\n"
                  " - Proximity sensor, Dual ambient light sensors\n\n"
                  "Wireless Connectivity:\n"
                  " - 802.11be Wi-Fi 7 with 2x2 MIMO\n"
                  " - 5G (sub-6 GHz and mmWave, model A3260)\n"
                  " - Gigabit LTE with 4x4 MIMO and LAA\n"
                  " - Bluetooth 6, Ultra Wideband chip (2nd gen)\n"
                  " - Thread networking technology\n"
                  " - NFC with reader mode\n"
                  " - Express Cards with power reserve\n",
            ),
            const SizedBox(height: 20),

            // ✅ Additional Information
            sectionTitle("Additional Information"),
            sectionText(
                "Guides, disassembly steps, and troubleshooting tips are available for common iPhone Air issues."),
            const SizedBox(height: 20),

            // ✅ Author
            sectionTitle("Author"),
            sectionText("Carsten Frauenheim (and one other contributor)"),
          ],
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

  // 🔹 Section Title
  static Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 🔹 Section Text
  static Widget sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
    );
  }

  // 🔹 Troubleshooting Card
  static Widget troubleshootingCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  // 🔹 Identification Section (custom with image)
  static Widget buildIdentificationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You can identify the iPhone Air by its extremely thin design and glass "camera plateau" that runs horizontally along the top of the back cover.\n',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Text(
            'You can also find the model number through the phone\'s UI by going to the ',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Text(
            'Settings > General > About.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Text(
            ' Tap on the number listed in the ',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Text(
            'Model Number',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Text(
            ' section and it should change to a format that looks like ',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Text(
            'A3260.\n',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Additionally, Apple offers a quick online tool to help identify your devices: ',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Identify your iPhone model"),
          ),
          const Text(
            'The iPhone Air features a 6.5-inch (diagonal) flat glass screen, thin black bezels, a pill-shaped, black "dynamic island" at the top of the screen, matte back glass, and glossy titanium side rails.\n',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          // 📷 Image Block
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(
              "images/apple/iphone_air/i1.png",
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Volume controls and the Action Button can be found on the left edge, while the power button and Camera Control button are situated on the right. A pill-shaped camera "plateau" containing the camera aligned horizontally protrudes from the back case. This model has no home button.\n',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Text(
            'The iPhone Air can be differentiated from other iPhones by being uniquely thin, while containing modern features like USB-C.',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
