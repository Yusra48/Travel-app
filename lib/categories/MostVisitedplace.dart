import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/VisitedDescription.dart';

class MostVisitedplace extends StatefulWidget {
  const MostVisitedplace({super.key});

  @override
  _MostVisitedplaceState createState() => _MostVisitedplaceState();
}

class _MostVisitedplaceState extends State<MostVisitedplace> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2020/05/18/22/17/travel-5188598_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/04/23/19/33/amalfi-2254776_960_720.jpg',
    'https://i.natgeofe.com/n/69e2cf60-ad59-4d20-bdd1-dc96f40ab4e8/petra-world-heritage-jordan_3x2.jpg?w=718&h=479',
    'https://cdn.pixabay.com/photo/2014/04/17/14/05/palace-of-winds-326523_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/10/05/19/00/hot-air-balloons-5630493_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/03/31/23/08/neuschwanstein-701732_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/08/20/03/maui-2729958_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/18/03/59/ginkaku-ji-temple-1464542_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/07/13/08/34/isle-of-sky-2499675_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/07/30/06/05/oia-4372057_1280.jpg',
  ];

  final List<String> texts = [
    'Barcelona,Spain',
    'Amalfi coast,Italy',
    'Petra, Jordan',
    'Jaipur, India',
    'Cappadocia, Turkey',
    'Neuschwanstein Castle, Germany',
    'Maui, Hawaii',
    'Kyoto, Japan',
    'Isle of Skye, Scotland',
    'Oia, Greece',
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
          'Most Visited Places',
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
                    builder: (context) => VisitedDescription(
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
