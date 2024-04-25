import 'package:flutter/material.dart';
import 'package:flutter_application_1/Subcategory/MountainDescription.dart';

class Mountains extends StatefulWidget {
  const Mountains({super.key});

  @override
  State<Mountains> createState() => _MountainsState();
}

class _MountainsState extends State<Mountains> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2021/12/16/11/08/mount-fuji-6874364_640.jpg',
    'https://cdn.pixabay.com/photo/2010/11/29/mount-everest-413_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/04/20/07/12/alaska-3335260_640.jpg',
    'https://cdn.pixabay.com/photo/2010/12/13/10/33/matterhorn-2893_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/11/05/23/41/mount-kilimanjaro-1025146_960_720.jpg',
  ];

  final List<String> texts = [
    'Mount Fuji,Japan',
    'Mount Everest, Himalaya',
    'Mount Denali, Alaska',
    'Matterhorn, Switerzland',
    'Mount Kilimanjaro ,Kenya',
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
          'Mountains',
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
                    builder: (context) => MountainDescription(
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
