import 'package:flutter/material.dart';
import 'package:flutter_application_1/Subcategory/BeachDescription.dart';

class Beachesplace extends StatefulWidget {
  const Beachesplace({super.key});

  @override
  State<Beachesplace> createState() => _BeachesplaceState();
}

class _BeachesplaceState extends State<Beachesplace> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2021/05/29/03/00/beach-6292382_640.jpg',
    'https://cdn.pixabay.com/photo/2018/10/15/20/22/seitan-limania-3749890_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/08/12/03/32/beach-1587503_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/03/18/22/05/matira-beach-680116_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/15/14/30/veligandu-island-1044366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/10/04/20/14/whitehaven-beach-7499018_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/03/09/00/29/napali-coast-91676_1280.jpg',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/d8/e8/14/kund-malir-beach-03008094313.jpg?w=900&h=600&s=1',
    'https://cdn.pixabay.com/photo/2016/08/18/17/13/dubai-1603411_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_640.jpg',
  ];

  final List<String> texts = [
    'Natadola Beach ',
    'Devil’s Beach ',
    'Turks & Caicos Beach',
    'Matira Beach ,Bora Bora',
    'Veligandu Island Beach ,Maldives',
    'Chalkies Beach, ',
    'Kaua i ,Hawaii Beach',
    'Kund Malir Beach',
    'Jumeirah Public Beach, Dubai',
    'Grace Bay Beach',
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
          'Beaches',
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
                    builder: (context) => BeachDescription(
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
