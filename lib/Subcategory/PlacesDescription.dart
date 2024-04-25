import 'package:flutter/material.dart';

class PlacesDescription extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  PlacesDescription({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    '“Crown of the Continent” is an apt nickname for this pair of parks, which feature some of the most impressive mountain scenery in North America. Joined together since 1932 as the world’s first international peace park, Glacier National Park in Montana and Waterton Lakes National Park in Alberta offer a contiguous high-country wonderland of rock, ice, water, and wood.',
    'Rome, historic city and capital of Roma provincia (province), of Lazio regione (region), and of the country of Italy. Rome is located in the central portion of the Italian peninsula, on the Tiber River about 15 miles (24 km) inland from the Tyrrhenian Sea. Once the capital of an ancient republic and empire whose armies and polity defined the Western world in antiquity and left seemingly indelible imprints thereafter, the spiritual and physical seat of the Roman Catholic Church, and the site of major pinnacles of artistic and intellectual achievement, Rome is the Eternal City, remaining today a political capital, a religious centre, and a memorial to the creative imagination of the past',
    'The largest and most famous of all the pyramids, the Great Pyramid at Giza, was commissioned by Snefrus son, Khufu, known also as Cheops, the later Greek form of his name. The pyramids base covered over 13 acres and its sides rose at an angle of 51 degrees 52 minutes and were over 755 feet long.',
    'Tokyo, city and capital of Tokyo to (metropolis) and of Japan. It is located at the head of Tokyo Bay on the Pacific coast of central Honshu. It is the focus of the vast metropolitan area often called Greater Tokyo, the largest urban and industrial agglomeration in Japan.The site of Tokyo has been inhabited since ancient times; the small fishing village of Edo existed there for centuries. Edo’s development into a city did not occur until the Tokugawa period (1603–1867), when it became the capital of the Tokugawa shogunate. During this period, however, the imperial family remained in Kyōto, the ancient imperial capital. With the Meiji Restoration of 1868, which ended the shogunate, the capital was moved to Edo. The city was renamed Tokyo, meaning “eastern capital.” ',
    'In c. 220 B.C., under Qin Shi Huang, sections of earlier fortifications were joined together to form a united defence system against invasions from the north. Construction continued up to the Ming dynasty (1368–1644), when the Great Wall became the worlds largest military structure. Its historic and strategic importance is matched only by its architectural significance.The Great Wall reflects collision and exchanges between agricultural civilizations and nomadic civilizations in ancient China. ',
    'An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan in memory of his favourite wife, the Taj Mahal is the jewel of Muslim art in India and one of the universally admired masterpieces of the worlds heritage.The uniqueness of Taj Mahal lies in some truly remarkable innovations carried out by the horticulture planners and architects of Shah Jahan. One such genius planning is the placing of tomb at one end of the quadripartite garden rather than in the exact centre, which added rich depth and perspective to the distant view of the monument. It is also, one of the best examples of raised tomb variety. ',
    'Cape Town, city and seaport, legislative capital of South Africa and capital of Western Cape province. The city lies at the northern end of the Cape Peninsula some 30 miles (50 kilometres), at its southernmost boundary, north of the Cape of Good Hope. Because it was the site of the first European settlement in South Africa, Cape Town is known as the country’s “mother city.” The indigenous inhabitants provided cattle but not labour, and the company imported slaves, mainly from East Africa, Madagascar, and the Bay of Bengal area. The slaves brought with them something of their culture and—especially in the case of the Muslims from the East Indies—their religion. Mixed-race unions took place, but strong racial and ethnic characteristics remained.',
    'The indigenous inhabitants provided cattle but not labour, and the company imported slaves, mainly from East Africa, Madagascar, and the Bay of Bengal area. The slaves brought with them something of their culture and—especially in the case of the Muslims from the East Indies—their religion. Mixed-race unions took place, but strong racial and ethnic characteristics remained.',
    'The state of Rajasthan in northwestern India includes part of the Thar Desert, as well as Ranthambhor National Park, home to wild tigers, and verdant Mount Abu and its elaborate temples. A camel safari near the inhabited desert trading center of Jaisalmer gives a hint of the areas beautiful desolation. Udaipurs lakefront setting provides rich counterpoint. The capital of Jaipur is a shoppers dream. Hire a car and driver to take in the spread-out sights. Stay in a heritage hotel to feel like a maharaja.',
    'Skardu is also a hub for trade and transportation in the Baltistan region. It is located at the confluence of the Indus and Shigar Rivers and is surrounded by several famous mountain peaks, such as Broad Peak, Gasherbrum I-II and K2, the second-highest mountain in the world. The town has a rich cultural heritage and is home to several historic landmarks, such as the Bhudha Rock and the Kharpocho Fort, a 16th-century fortress that overlooks Skardu town from a hilltop. Skardu is known for its traditional handicrafts, particularly its intricate woodcarvings and embroidery.',
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
