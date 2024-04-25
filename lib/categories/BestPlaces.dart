import 'package:flutter/material.dart';
import 'package:flutter_application_1/Subcategory/PlacesDescription.dart';

class Bestplaces extends StatefulWidget {
  const Bestplaces({super.key});

  @override
  State<Bestplaces> createState() => _BestplacesState();
}

class _BestplacesState extends State<Bestplaces> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2022/01/24/17/36/glacier-national-park-6964158_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/06/20/12/rome-7246901_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/12/17/05/21/star-1096934_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/02/05/11/29/tokyo-3131978_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/06/18/21/09/great-wall-of-china-814143_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/06/05/21/09/cultural-tourism-5264542_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/12/23/16/33/capetown-3891441_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/04/09/15/36/hunza-2215996_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/09/11/17/20/jaipur-3670085_640.jpg',
    'https://cdn.pixabay.com/photo/2018/08/09/06/03/gilgit-3593829_960_720.jpg',
  ];

  final List<String> texts = [
    'Glacier National Park',
    'Rome',
    'Pyramids Egypt',
    'Tokyo Japan',
    'Great wall of china',
    'Taj Mahal India',
    'CapeTown SouthAfrica',
    'Hunza valley',
    'Rajasthan India',
    'Skardu Pakistan',
  ];

  List<Map<String, dynamic>> bookmarkedPlaces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Icon(Icons.sort),
        ),
        title: const Text(
          'Best Places',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final isBookmarked = bookmarkedPlaces
              .any((place) => place['imageUrl'] == imageUrls[index]);

          return GestureDetector(
            onTap: () {
              if (index < 0 ||
                  index >= imageUrls.length ||
                  index >= texts.length) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Invalid index'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacesDescription(
                      imageUrl: imageUrls[index],
                      title: texts[index],
                      index: index,
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 250,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(imageUrls[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              texts[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.black54,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked
                                  ? Colors.orangeAccent
                                  : Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isBookmarked) {
                                  bookmarkedPlaces.removeWhere((place) =>
                                      place['imageUrl'] == imageUrls[index]);
                                } else {
                                  bookmarkedPlaces.add({
                                    'imageUrl': imageUrls[index],
                                    'title': texts[index],
                                  });
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void updateBookmarks(List<Map<String, dynamic>> updatedBookmarks) {
    setState(() {
      bookmarkedPlaces = updatedBookmarks;
    });
  }
}
