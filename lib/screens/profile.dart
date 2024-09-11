import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    bool isGeolocationEnabled = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 75, 105, 255),
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 75, 105, 255),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://your-avatar-image-url.com'), // Replace with your image
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pranesh Chakma",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "support@codingwithT.com",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSettingOption(Icons.location_on_outlined, "Address Lists",
                    "Set shopping delivery address"),
                _buildSettingOption(Icons.payment, "Instant Payment",
                    "E-Wallet, credit cards, & instant debit registered"),
                _buildSettingOption(Icons.account_balance, "Bank Account",
                    "Withdraw balance to registered bank account"),
                _buildSettingOption(Icons.security, "Account Security",
                    "E-Wallet, credit cards, & instant debit registered"),
                _buildSettingOption(Icons.notifications, "Notifications",
                    "Set any kind of notification message"),
                _buildSettingOption(Icons.privacy_tip, "Account Privacy",
                    "Manage data usage and connected accounts"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.blue,
                  title: Text("Geolocation"),
                  subtitle: Text("Set recommendation based on location"),
                  value: isGeolocationEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isGeolocationEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingOption(IconData icon, String title, String subtitle) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue.shade700),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle: Text(subtitle),
    onTap: () {
      // Add action on tap if needed
    },
  );
}
