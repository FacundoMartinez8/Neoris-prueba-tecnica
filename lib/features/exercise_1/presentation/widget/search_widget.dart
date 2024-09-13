import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List<String> items;
  final Function(String) onSearch;

  const SearchScreen({super.key, required this.items, required this.onSearch});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> filteredItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Buscar...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (query) {
              widget.onSearch(query);
            },
          ),
        ),
      ]),
    );
  }
}
