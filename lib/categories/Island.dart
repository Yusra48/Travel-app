import 'package:flutter/material.dart';
import 'package:flutter_application_1/Subcategory/IslandDescription.dart';

class Island extends StatefulWidget {
  const Island({super.key});

  @override
  State<Island> createState() => _IslandState();
}

class _IslandState extends State<Island> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2016/05/26/11/32/seychelles-1416944_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/04/29/17/00/mauritius-5109739_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/12/18/10/02/maldives-4703551_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/12/03/48/thailand-1451383_960_720.jpg',
    'https://cdn.pixabay.com/photo/2023/05/04/02/24/bali-7969001_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/12/16/22/22/bora-bora-3023437_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/02/14/11/12/boracay-2065643_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/05/11/16/25/panama-4195997_1280.jpg',
  ];

  final List<String> texts = [
    'Seychelles',
    'Mauritius',
    'Maldives',
    'Phuket, Thailand',
    'Bali, Indonesia',
    'Bora Bora, French Polynesia',
    'Boracay, Philippines',
    'Islas Secas, Panama',
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
          'Island',
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
                    builder: (context) => IslandDescription(
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
