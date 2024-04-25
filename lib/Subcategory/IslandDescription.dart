import 'package:flutter/material.dart';

class IslandDescription extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  IslandDescription({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    'Yet some stretches of sand are so deserted that parts of the movie Castaway were filmed here. The ultimate draw, however, is the nature—the white beaches here are so beautiful that visiting them borders on a religious experience.Seychelles is one of the best spots in the Indian Ocean for snorkeling. Head to the islands of La Digue and Félicité for the best variety of sealife.',
    'Instagram and Pinterest have created renewed interest in this island in the Indian Ocean, thanks to its “underwater waterfall”—a visually stunning runoff of sand and silt best viewed from above. Roughly 550 miles east of Madagascar, Mauritius may also be home to a lost continent hiding beneath the waves.',
    'Maldives is one of the most sought-after tropical destinations in the world. It’s dense with megawatt luxury villas and overwater bungalows, and the diving is unreal (though, sadly, some of the coral has been threatened by bleaching). Still, there’s a dive for all skill levels at Ari Atoll, where you can swim with rays and, deeper down, reef sharks.',
    'Phuket is not exactly a hidden gem, but it’s still a warm and lovely place to vacation, whether you want a busy immersion in city life or a quiet, family-friendly experience. Since it’s the biggest island in Thailand, you’re sure to find something to fit your desired itinerary. In general, though, we’d recommend skipping the overcrowded west coast and heading to quiet corners like Cape Panwa, where you’ll find luxury accommodations and rum distilleries that feel a bit more removed from the oft-touristed track.',
    'Nowhere on the planet offers the same combination of surfing, spirituality, and sun-kissed pleasure as Bali. The island has sadly become synonymous with the concept of overtourism, but there are still enclaves of hidden cultural treasures and undiscovered gems if you know where to look.',
    'Famous for its turquoise waters and verdant mountains, Bora Bora is pretty close to heaven on earth. The island has some of the best resorts in the South Pacific as well: Our readers are fans of InterContinental Bora Bora Le Moana Resort, Conrad Bora Bora Nui, and Four Seasons Resort Bora Bora.',
    'At less than four square miles, this compact Philippine island transformed from under-the-radar to overtouristed in the span of a few rocky decades—it was even temporarily shut down in 2018 to allow for much-needed redevelopment and rehabilitation. But with its sugary sands, magical sunsets, and see-your-feet-clear water, we suspect Boracay’s popularity isn’t going to wane anytime soon.',
    'An entire archipelago owned by conservationist Louis Bacon, Islas Secas has the perfect combination of rugged natural beauty and pure resort luxury. The retreat only allows a maximum of 18 guests at one time, with a handful of guest cottages run entirely on solar energy. Theres no TV on the island, but youll be too busy fishing and kayaking to notice.',
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
