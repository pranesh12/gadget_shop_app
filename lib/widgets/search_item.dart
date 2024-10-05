import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  SearchItemState createState() => SearchItemState();
}

class SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 27,
                ),
                const SizedBox(
                    width: 10), // Add some spacing between icon and input
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Here",
                    ),
                  ),
                )
              ],
            ),
          ),

          //Items wiedget
        ],
      ),
    );
  }
}
