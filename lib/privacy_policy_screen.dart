import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF2E7D71);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Privacy Policy'),
        backgroundColor: buttonColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable terms
            Expanded(
              child: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: const [
                  Section(
                    title: 'Introduction',
                    children: [
                      Paragraph(
                        'This Privacy Policy explains how RePair+ collects, uses, and protects your information when you use our mobile application for device repair services.',
                      ),
                    ],
                  ),
                  Section(
                    title: 'Information We Collect',
                    children: [
                      Bullet('Account details (name, email, password)'),
                      Bullet('Device repair history (device type, issue, repair logs)'),
                      Bullet('Location data (only if you enable the shop locator)'),
                    ],
                  ),
                  Section(
                    title: 'How We Use Your Information',
                    children: [
                      Bullet('To provide app features (repair shop locator, tutorials, history tracking)'),
                      Bullet('To improve the app experience.'),
                      Bullet('To send notifications about updates or repairs (optional).'),
                    ],
                  ),
                  Section(
                    title: 'Data Sharing & Disclosure',
                    children: [
                      Bullet('We do not sell your personal data to third parties.'),
                      Bullet('Data may be shared with trusted third parties only when necessary (e.g., Google Maps API for shop locator functionality).'),
                    ],
                  ),
                  Section(
                    title: 'Data Security',
                    children: [
                      Bullet('Your data is stored securely using Firebase authentication and database encryption.'),
                      Bullet('You are responsible for protecting your account credentials and keeping them confidential.'),
                    ],
                  ),
                  Section(
                    title: 'Your Rights',
                    children: [
                      Bullet('Right to update or delete your account.'),
                      Bullet('Right to disable location sharing.'),
                      Bullet('Right to contact support for privacy concerns.'),
                    ],
                  ),
                  Section(
                    title: 'Data Retention',
                    children: [
                      Bullet('Your data is retained as long as your account remains active.'),
                      Bullet('If you delete your account, your personal data will be removed from our system within 30 days.'),
                    ],
                  ),
                  Section(
                    title: 'Changes to Privacy Policy',
                    children: [
                      Bullet('We may update this Privacy Policy from time to time. Users will be notified of any changes through the app.'),
                    ],
                  ),
                  Section(
                    title: 'Contact Information',
                    children: [
                      Bullet('For questions about this Privacy Policy, you may contact the RePair+ team at support@repairplus.com.'),
                    ],
                  ),
                ],
              ),
            ),

            // Checkbox + Button
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        activeColor: buttonColor,
                        onChanged: (val) {
                          setState(() {
                            _isChecked = val ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "I have read and agree to the Privacy Policy",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                        Navigator.pop(context, true); // return "agreed"
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        disabledBackgroundColor: Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Section with a green title and child widgets
class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Section({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF49A37F),
              )),
          const SizedBox(height: 8),
          ...children.map(
                (w) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: w,
            ),
          ),
        ],
      ),
    );
  }
}

/// Paragraph widget
class Paragraph extends StatelessWidget {
  final String text;
  const Paragraph(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, height: 1.45, color: Color(0xFF333333)),
    );
  }
}

/// Bullet point widget
class Bullet extends StatelessWidget {
  final String text;
  const Bullet(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 8, color: Color(0xFF2BB24C)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, height: 1.45, color: Color(0xFF333333)),
          ),
        ),
      ],
    );
  }
}
