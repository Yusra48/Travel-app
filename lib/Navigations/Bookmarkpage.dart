import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookmarkedPlaces;

  const BookmarkPage({
    Key? key,
    required this.bookmarkedPlaces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Places'),
        backgroundColor: Colors.blueGrey,
      ),
      body: bookmarkedPlaces.isEmpty
          ? const Center(
              child: Text(
                'No bookmarked places yet',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedPlaces.length,
              itemBuilder: (context, index) {
                final bookmarkedPlace = bookmarkedPlaces[index];
                return ListTile(
                  leading: Image.network(bookmarkedPlace['imageUrl']),
                  title: Text(bookmarkedPlace['title']),
                );
              },
            ),
    );
  }
}
