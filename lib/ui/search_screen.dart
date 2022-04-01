import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _startSearchController = TextEditingController();
  final _endSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search The Area'),
        backgroundColor: Color(0xff22577E),
      ),
      body: Container(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              controller: _startSearchController,
              autofocus: false,
              showCursor: false,
              decoration: InputDecoration(
                hintText: 'Starting Point',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
                filled: true,
                fillColor: Color(0xff5584AC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  gapPadding: 0.0,
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _endSearchController,
              autofocus: false,
              showCursor: false,
              decoration: InputDecoration(
                hintText: 'Destination Point',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
                filled: true,
                fillColor: Color(0xff5584AC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  gapPadding: 0.0,
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
