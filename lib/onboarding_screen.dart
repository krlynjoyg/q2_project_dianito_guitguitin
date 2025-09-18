import 'package:flutter/material.dart';
import 'home_screen.dart'; // make sure you have this file

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _buildPage({
    required Widget content,
    required List<Color> gradient,
    required String title,
    required String description,
    required int totalPages,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top row (Back + Skip)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  )
                else
                  SizedBox(width: 48),
                TextButton(
                  onPressed: () {
                    // Skip goes directly to HomeScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),

            // Image content
            content,

            // Title + Description
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            // Indicator + Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    totalPages,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_currentPage < totalPages - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to HomeScreen after onboarding
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    }
                  },
                  child: Text(
                    _currentPage == totalPages - 1 ? "Get Started" : "Next",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = 4;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          // Screen 1
          _buildPage(
            content: Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset("images/onboard/onboard1.png", height: 120),
              ),
            ),
            gradient: [Colors.blue, Colors.purple],
            title: "Repair. Reuse. Reduce.",
            description:
            "Join us in extending the life of your gadgets and reducing e-waste.",
            totalPages: totalPages,
          ),

          // Screen 2
          _buildPage(
            content: Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset("images/onboard/onboard2.png", height: 120),
              ),
            ),
            gradient: [Colors.green, Colors.teal],
            title: "Find Nearby Repair Shops",
            description:
            "Quickly locate trusted repair shops near you with our built-in locator.",
            totalPages: totalPages,
          ),

          // Screen 3
          _buildPage(
            content: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset("images/onboard/onboard3.png",
                        height: 120),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.build, color: Colors.blue),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.build_circle, color: Colors.green),
                  ),
                ),
              ],
            ),
            gradient: [Color(0xFF4CAF50), Color(0xFF2196F3)],
            title: "DIY Repair Tutorials",
            description:
            "Access easy-to-follow guides to repair devices yourself, save money, and reduce waste.",
            totalPages: totalPages,
          ),

          // Screen 4
          _buildPage(
            content: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset("images/onboard/onboard4.png",
                        height: 120),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.build, color: Colors.blue),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.build_circle, color: Colors.green),
                  ),
                ),
              ],
            ),
            gradient: [Color(0xFF4CAF50), Color(0xFF2196F3)],
            title: "Track Your Gadget's Lifespan",
            description:
            "Monitor your repair history and extend the life of your electronics.",
            totalPages: totalPages,
          ),
        ],
      ),
    );
  }
}
