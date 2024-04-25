import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  DescriptionPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    'The Strip has an ability to continuously reinvent itself and offer something for everyone from its casinos, dazzling lights, iconic resorts, world-class shows, decadent dining, spas, shopping, and so much more.',
    'Times Square is known for its dazzling billboards, neon lights, and bustling atmosphere, it is a captivating destination that never fails to mesmerize visitors from around the world. In fact, its practically become an adjective in itself to describe heavily touristic places. Each year, Times Square attracts an estimated 50 million visitors, making it one of the most visited places in the world.',
    'The Colosseum in Rome, standing majestically as a symbol of ancient Roman engineering and grandeur, is an iconic tourist attraction that transports visitors back in time to witness the spectacles of gladiatorial combat and grand public events. Each year, millions of tourists from around the world flock to this architectural marvel, marveling at its impressive amphitheater and immersing themselves in the rich history that unfolds within its ancient walls.',
    'Niagara Falls, located on the border between the United States and Canada, is a breathtaking natural wonder that captivates visitors with its powerful cascades of water and stunning beauty. The falls consist of three main sections: the Horseshoe Falls, American Falls, and Bridal Veil Falls, each offering a unique perspective and awe-inspiring views. ',
    'Walt Disney World Resort in Orlando, Florida, is a magical and expansive destination that offers unparalleled entertainment, enchanting experiences, and beloved Disney characters. What sets Disney World in Orlando apart is its sheer size and scope. It is the largest Disney resort in the world, covering an area of over 25,000 acres.',
    'The Forbidden City, located in the heart of Beijing, is a magnificent imperial palace complex that served as the home of Chinese emperors for over 500 years. Its UNESCO World Heritage status, cultural significance, and the opportunity to witness firsthand the grandeur of ancient Chinese civilization make the Forbidden City an essential stop for history enthusiasts and travelers seeking a glimpse into Chinas imperial splendor.',
    'Universal Studios Japan in Osaka is a world-renowned theme park that brings the magic of movies to life. With its immersive attractions, thrilling rides, and beloved characters from both Universal Pictures and Japanese pop culture, Universal Studios Osaka offers a unique blend of Hollywood entertainment and Japanese charm',
    'Ocean Park, located on the southern side of Hong Kong Island, is a renowned marine-themed park. The parks distinct combination of amusement park elements and conservation efforts sets Ocean Park apart. In addition to the exciting rides and entertainment, Ocean Park is committed to marine conservation and education, offering visitors the opportunity to learn about marine ecosystems, endangered species, and environmental sustainability.',
    'The Eiffel Tower, is an iconic symbol of Paris and one of the worlds most recognizable landmarks. It attracts approximately 7 million visitors each year. Its towering presence and intricate ironwork offer breathtaking panoramic views of the city. Rising over 300 meters above the Parisian skyline, the Eiffel Tower offers multiple levels for exploration and observation, as well as a range of restaurants.',
    'Lotte World, located in Seoul, South Korea, is an expansive theme park that offers a unique blend of thrilling rides, entertainment, and shopping experiences. With both an indoor and outdoor section, visitors can enjoy a range of attractions, including roller coasters, water rides, live performances, and a variety of themed zones to cater to different interests and age groups.',
  ];

  final List<String> rating = [
    '4.3',
    '3.5',
    '3.7',
    '4.0',
    '3.2',
    '3.0',
    '4.8',
    '4.5',
    '3.8',
    '3.5',
  ];

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty || title.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error: Missing image URL or title'),
        ),
      );
    }

    if (index < 0 || index >= description.length || index >= rating.length) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error: Invalid index'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        rating[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
