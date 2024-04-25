import 'package:flutter/material.dart';

class MountainDescription extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  MountainDescription({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    'Mount Fuji, highest mountain in Japan. It rises to 12,388 feet (3,776 metres) near the Pacific Ocean coast in Yamanashi and Shizuoka ken (prefectures) of central Honshu, about 60 miles (100 km) west of the Tokyo-Yokohama metropolitan area. It is a volcano that has been dormant since its last eruption, in 1707, but is still generally classified as active by geologists. The mountain is the major feature of Fuji-Hakone-Izu National Park (1936)',
    'Mount Everest, mountain on the crest of the Great Himalayas of southern Asia that lies on the border between Nepal and the Tibet Autonomous Region of China.Like other high peaks in the region, Mount Everest has long been revered by local peoples. Its most common Tibetan name, Chomolungma, means “Goddess Mother of the World” or “Goddess of the Valley.” The Sanskrit name Sagarmatha means literally “Peak of Heaven.”',
    'Denali, highest peak in North America. It is located near the centre of the Alaska Range, with two summits rising above the Denali Fault, in south-central Alaska, U.S.Denali’s official elevation figure of 20,310 feet (6,190 metres), established by the United States Geological Survey in September 2015, was the product of a thorough remeasurement of the mountain’s height conducted earlier that year using state-of-the-art equipment',
    'Matterhorn, one of the best-known mountains (14,692 feet [4,478 metres]) in the Alps, straddling the frontier between Switzerland and Italy, 6 miles (10 km) southwest of the village of Zermatt, Switzerland. Though from the Swiss side it appears to be an isolated horn-shaped peak, it is actually the butt end of a ridge. The Swiss slope is not nearly as steep or as difficult to climb as the grand terraced walls of the Italian slope',
    'The majestic mountain is a snow-capped volcano. Located in Tanzania, Mount Kilimanjaro is Africas tallest mountain at about 5,895 meters (19,340 feet). It is the largest free-standing mountain rise in the world, meaning it is not part of a mountain range.The mountain and its surrounding forests were designated a game reserve in the early part of the 20th century. In 1973 Mount Kilimanjaro National Park was established to protect the mountain above the tree line as well as the six forest corridors that extend downslope through the montane forest belt',
  ];
  final List<String> rating = [
    '4.3',
    '3.5',
    '3.7',
    '4.0',
    '3.2',
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
