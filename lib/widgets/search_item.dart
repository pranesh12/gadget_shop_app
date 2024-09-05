import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
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
                Container(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search Here"),
                  ),
                ),
              ],
            ),
          ),

          //Items wiedget
        ],
      ),
    );
  }
}
