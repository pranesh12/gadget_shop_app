import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let's Create your first Account",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            //First Name and Last Name
            Row(
              children: [
                //First name
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          Icon(Icons.person), // Icon within the text field
                      hintText: "First name",
                      border: InputBorder.none, // Remove the default border
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10), // Adjust padding inside the text field
                    ),
                  ),
                )),
                //Last Name
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                          Icon(Icons.person), // Icon within the text field
                      hintText: "Last name",
                      border: InputBorder.none, // Remove the default border
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10), // Adjust padding inside the text field
                    ),
                  ),
                )),
              ],
            ),

            //Email
            Row(
              children: [
                //First name
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                "Create Account",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            )
          ],
        ),
      ),
    );
  }
}
