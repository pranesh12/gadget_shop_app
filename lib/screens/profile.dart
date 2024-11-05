import 'package:flutter/material.dart';
import 'package:kick_start/screens/login.dart';
import 'package:kick_start/screens/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late SharedPreferences prefs;
  String firstName = "";
  String lastName = "";
  String email = "";
  String id = "";
  String token = "";

  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    String? storedFirstName = prefs.getString('firstName');
    String? storedLastName = prefs.getString('lastName');
    String? storedEmail = prefs.getString('email');
    String? storedId = prefs.getString('id');
    String? stroedToken = prefs.getString('token');

    setState(() {
      firstName = storedFirstName ?? "";
      lastName = storedLastName ?? "";
      email = storedEmail ?? "";
      id = storedId ?? "";
      token = stroedToken ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 75, 105, 255),
            child: Row(
              children: [
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSettingOption(Icons.shopping_cart, "Orders",
                    "View and manage your orders", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Order(
                              email: email,
                              token: token,
                            )),
                  );
                }),
                email.isNotEmpty
                    ? _buildSettingOption(
                        Icons.logout, "Log out", "Sign out of your account",
                        () {
                        prefs.clear();
                        setState(() {
                          firstName = "";
                          lastName = "";
                          email = "";
                        });
                      })
                    : _buildSettingOption(
                        Icons.login, "Sign in", "Sign in of your account", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      }),
                _buildSettingOption(Icons.account_balance, "Bank Account",
                    "Withdraw balance to registered bank account", () {}),
                _buildSettingOption(
                    Icons.security,
                    "Account Security",
                    "E-Wallet, credit cards, & instant debit registered",
                    () {}),
                _buildSettingOption(Icons.notifications, "Notifications",
                    "Set any kind of notification message", () {}),
                _buildSettingOption(Icons.privacy_tip, "Account Privacy",
                    "Manage data usage and connected accounts", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingOption(
    IconData icon, String title, String subtitle, VoidCallback? onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue.shade700),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle: Text(subtitle),
    onTap: onTap ?? () {},
  );
}
