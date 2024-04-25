import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/Descriptionpage.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  final List<String> imageUrls = [
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-world-las-vegas-strip.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-world-times-square.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attractions-world.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-world--niagara.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-world-hollywood-magical-kingdom.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-forbidden-city-1.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attraction-universal-osaka.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/ocean-park-most-visited-tourist-attraction-world.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/most-visited-tourist-attration-eiffel-tower.png',
    'https://www.homeexchange.com/blog/content/images/2023/09/lotte-world-most-visited-tourist-attractions-world.png.png',
  ];

  final List<String> texts = [
    'Las Vegas Strip, Las Vegas',
    'Times Square, N.Y.C.',
    'The Colosseum, Rome',
    'Niagara Falls, Niagara',
    'Disneyworld’s Magic Kingdom, Orlando',
    'The Forbidden City, Beijing',
    'Universal Studios, Japan, Osaka',
    'Ocean Park, Hong Kong',
    'The Eiffel Tower, Paris',
    'Lotte World, Seoul',
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
          'Popular Places',
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
                    builder: (context) => DescriptionPage(
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
