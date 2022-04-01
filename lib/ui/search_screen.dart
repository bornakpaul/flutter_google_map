import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _startSearchController = TextEditingController();
  final _endSearchController = TextEditingController();

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    String apikey = "AIzaSyA60flZWx5tZvTgyDF_8jXTqlii04GvZps";
    googlePlace = GooglePlace(apikey);
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

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
              style: const TextStyle(fontSize: 18, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Starting Point',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white70),
                filled: true,
                fillColor: const Color(0xff5584AC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  gapPadding: 0.0,
                  borderSide: BorderSide.none,
                ),
              ),
              cursorColor: Colors.white,
              onChanged: (value) {
                if (debounce?.isActive ?? false) debounce!.cancel();
                debounce = Timer(const Duration(milliseconds: 1000), () {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {}
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _endSearchController,
              autofocus: false,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Destination Point',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white70),
                filled: true,
                fillColor: const Color(0xff5584AC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  gapPadding: 0.0,
                  borderSide: BorderSide.none,
                ),
              ),
              cursorColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
