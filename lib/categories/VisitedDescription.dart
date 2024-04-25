import 'package:flutter/material.dart';

class VisitedDescription extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  VisitedDescription({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    'Barcelona is a city with a wide range of original leisure options that encourage you to visit time and time again. Overlooking the Mediterranean Sea, and famous for Gaudí and other Art Nouveau architecture, Barcelona is one of Europe’s trendiest cities.',
    'The Amalfi Coast (Italian: Costiera amalfitana or Costa dAmalfi) is a stretch of coastline in southern Italy overlooking the Tyrrhenian Sea and the Gulf of Salerno. It is located south of the Sorrentine Peninsula and north of the Cilentan Coast.',
    'Petra, ancient city, centre of an Arab kingdom in Hellenistic and Roman times, the ruins of which are in southwest Jordan. The city was built on a terrace, pierced from east to west by the Wadi Mūsā (the Valley of Moses)—one of the places where, according to tradition, the Israelite leader Moses struck a rock and water gushed forth. The valley is enclosed by sandstone cliffs veined with shades of red and purple varying to pale yellow, and for this reason Petra was called by the 19th-century English biblical scholar John William Burgon a “rose-red city half as old as Time.”',
    'Jaipur, city, capital of Rajasthan state, northwestern India. It is situated in the east-central part of the state, roughly equidistant from Alwar (northeast) and Ajmer (southwest). It is Rajasthan’s most-populous city.A walled town surrounded (except to the south) by hills, the city was founded in 1727 by Maharaja Sawai Jai Singh to replace nearby Amber (now Amer, a part of Jaipur) as the capital of the princely state of Jaipur (founded by the Rajputs in the 12th century CE). ',
    'In ancient geography, Cappadocia (Turkish: Kapadokya) was the name of the extensive inland district of Asia Minor (Asian part of modern Turkey). Cappadocia region is the place where nature and history come together most beautifully within the world. While geographic events are forming Peribacalari (fairy chimneys), during the historical period, humans had carried the signs of thousand years old civilizations with carving houses and churches within these earth pillars and decorating them with frisks.',
    ' Neuschwanstein was opened to the public. The shy king had built the castle in order to withdraw from public life – now vast numbers of people came to view his private refuge.Today Neuschwanstein is one of the most popular of all the palaces and castles in Europe. Every year 1.4 million people visit "the castle of the fairy-tale king". In the summer around 6,000 visitors a day stream through rooms that were intended for a single inhabitant. This in combination with the alpine climate and light leads to considerable stress on the valuable furniture and textiles, which we are working hard to preserve.',
    'Lush rainforests, black-sand beaches, waterfalls cascading into deep-blue lagoons—Maui is a place where nature really shows off. Wake up early to catch the sunrise on Haleakalā, then stay to explore hiking trails and otherworldly volcanic formations at Haleakalā National Park. Take a drive on the winding Road to Hana to discover untouched beaches (with unbelievable coastal views along the way), or hop on a boat and go whale-watching or snorkeling. If you’re looking for something more low-key, pick up a plate lunch or some fish tacos and spend a do-nothing day at Kaanapali Beach,',
    'Kyoto is one of the oldest municipalities in Japan, having been chosen in 794 as the new seat of Japans imperial court by Emperor Kanmu. The original city, named Heian-kyō, was arranged in accordance with traditional Chinese feng shui following the model of the ancient Chinese capitals of Changan and Luoyang. The emperors of Japan ruled from Kyoto in the following eleven centuries until 1869. It was the scene of several key events of the Muromachi period, Sengoku period, and the Boshin War, such as the Ōnin War, the Honnō-ji Incident, the Kinmon incident, and the Battle of Toba Fushimi. The capital was relocated from Kyoto to Tokyo after the Meiji Restoration.',
    'IsleofSkye.com: the ultimate guide to the Isle of Skye in the Highlands of Scotland. Helping visitors find some where to stay from our large selection of Accommodation, we have listings for Bed and Breakfast, Self-Catering Cottages, Campsites and Hotels.Our Skye Guide has an expanding collection of Activities and Attractions. If you would like a walking guide, boat trip or an arts or craft gallery you will find it here.Skye is one of the top locations in Scotland to visit. It is famous for its scenery and landscapes that will take your breath away.',
    'Stunning Oia is carved out of Santorinis cliffs—a panorama of white buildings dotted with colorful rooftops typical of the country—set against the deep blue sea. This is the place to spend the day on a boat or on a chaise lounge taking in the sun, then enjoying long meals and strolls through town. There are also pretty churches to see, which makes for a relaxing afternoon outing. Sunsets in Oia are legendary. Watch from a café, or, better yet, from a boat—you’ll be spellbound',
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
