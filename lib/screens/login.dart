import 'package:flutter/material.dart';
import 'package:gadget_shop/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
      ),
      body: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Welcome back",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const Text(
              "Discover Limitless Choices and Unmatched Convenience",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),

            //Email
            Row(
              children: [
                //First name
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 5), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the input field
                    borderRadius: BorderRadius.circular(
                        10), // Border radius for rounded corners

                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon:
                          Icon(Icons.email), // Icon within the text field
                      hintText: "Email",
                      border: InputBorder.none, // Remove the default border
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10), // Adjust padding inside the text field
                    ),
                  ),
                )),
              ],
            ),
            //Password
            Row(
              children: [
                //First name
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 5), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the input field
                    borderRadius: BorderRadius.circular(
                        10), // Border radius for rounded corners

                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon:
                          Icon(Icons.password), // Icon within the text field
                      hintText: "Password",
                      border: InputBorder.none, // Remove the default border
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10), // Adjust padding inside the text field
                    ),
                  ),
                )),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue,
              ),
              child: const Center(
                  child: Text(
                "Sign  In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),

            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                    child: Text(
                  "create Account",
                  style: TextStyle(fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
