import 'package:flutter/material.dart';

class OrderAmmount extends StatelessWidget {
  const OrderAmmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 1,
          )),
      child: const Column(
        children: [
          //Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "\$3267",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),

          SizedBox(
            height: 10,
          ),
          //Shiiping feee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Fee",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "\$3267",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          //Total

          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "\$3267",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),

          //Shipping Address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Change",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),

          SizedBox(
            height: 20,
          ),
          //Customer Name
          Row(
            children: [
              Text(
                "Customer Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          //Customer phone
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(
                width: 16,
              ),
              Text(
                "+01515223112",
              )
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          //Customer phone
          Row(
            children: [
              Icon(Icons.location_city),
              SizedBox(
                width: 16,
              ),
              Text(
                "NaraynKhyia,Khagrachari",
              )
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          //Customer phone
          Row(
            children: [
              Icon(Icons.email),
              SizedBox(
                width: 16,
              ),
              Text(
                "Praneshck7@gmail.com",
              )
            ],
          ),
        ],
      ),
    );
  }
}
