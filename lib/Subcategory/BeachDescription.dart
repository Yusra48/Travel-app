import 'package:flutter/material.dart';

class BeachDescription extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  BeachDescription({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  final List<String> description = [
    'Natadola Beach, located on Fijis main island of Viti Levu, is the most beautiful white-sand beach in Fiji. Natadolas lush beauty and variety of recreational activities, from snorkeling to horseback riding, draws vacationers from around the world.',
    'At the southwestern tip of Virgin Gorda is the picturesque Devil’s Bay. This horseshoe shaped bay is a welcome sight at the end of the 15-minute hike through dry scrub vegetation and boulders from the car park at the top of The Baths. A second trail at the eastern end leads visitors to The Baths, through massive granite boulders, where hikers should be prepared to crawl, climb ladders and wade through water. Caution must be used at all times to avoid slipping or falling.',
    'The Turks and Caicos is a small tropical archipelago nation located south of the Bahamas. Our islands offer spectacular beaches, a pristine marine environment, luxury resorts, friendly people, and fine dining.There’s so much to do and discover. Incredible beaches, crystal clear ocean water, and abundant marine life are yours to explore. Quite simply, the Turks and Caicos is the best beach destination.',
    'Bora Bora is one of the magical islands that make up French Polynesia in the South Pacific. Just 18 miles long, this lush little slipper of land lies in a protected lagoon edged by fine white sandy shores -- the best located at Matira Point. There are a number of reasons why Bora Bora boasts the nickname "the Romantic Island," including the secluded beaches, intimate hotels and quiet atmosphere that embraces visitors.',
    'Veligandu, is a natural island shaped by the Indian Ocean. It is famed for its sandbank, ideal for romance, relaxation, snorkelling, diving, yachting, spa and culinary delights. Surrounded by a stunning lagoon and white sandy beach, its the sole resort on Veligandu Island, It is 600 meters long by 150 meters wide, about 22 acres. Veligandu is accessible by a scenic 20-minute seaplane ride from Velana International Airport. With 100 villas harmonizing with the islands beauty, accommodation includes Sunset Ocean Pool Villas, Ocean Pool Villas, Sunset Ocean Villas, Ocean Jacuzzi Villas, Sunset Jacuzzi Beach Villas, Jacuzzi Beach Villas, Beach Villas',
    'Whitehaven Beach is on Whitsunday Island, Queensland, Australia. The island is accessible by boat, seaplane & helicopter from Airlie Beach, as well as Hamilton Island. It lies across from Stockyard Beach, better known as Chalkies Beach, on Haslewood Island. The seven kilometres beach is known for its crystal white silica sands and turquoise coloured waters. The beach has tour barbeque and camping facilities.',
    'Kauai, the oldest island of the Hawaiian Islands, is a place where worries vanish in the trade winds, warm saltwater laps the golden sands of Kauai’s Beaches, and the rain forests of Kōke’e host earth’s rarest plants and birds. The tiny tropical island of Kauaʻi has kept herself charmed, mysterious, and unconquered. Here you will experience the secrets of the Garden Island as you dive into Kauai’s beauty. From the majestic Na Pali Coast to the breathtaking Waimea Canyon, Kauai boasts some of the world’s most spectacular natural wonders. Dive into crystal-clear waters, hike lush rainforests, and marvel at cascading waterfalls that dot the island’s diverse landscape',
    'Kund Malir is a beach in Balochistan, Pakistan located in Hingol National Park. It is located about 150 kilometres (93 mi) from Zero-Point on Makran Coastal Highway.[2] Hingol National Park is the largest national park in Pakistan. It is located 236.8 kilometres (147.1 mi) west of Karachi, the largest city of Pakistan.[3][4] The drive between Kund Malir and Ormara is known for being scenic, and traverses a rural part of the country. There are estimated to be 11 active mud volcanoes in Kund Malir',
    'A beautiful, wide, sandy beach. The entrance to the water is on a gentle slope, the bottom of the water is sandy. The water is very warm, without algae, but a bit cloudy. There are changing rooms, showers, toilets. There is no fee for access. On the minus side, there is only one kiosk, very small, for the entire beach, where you can get water, juice or snacks.',
    'The entirety of Grace Bay is excellent and breathtaking, with clean turquoise water and soft white sand, and no rocks, seaweed, or pollution. An extensive barrier reef is located about a mile (1.6 km) offshore, and protects Grace Bay from the ocean swells of the Atlantic, which helps to keep the water at the beach calm and safe.Grace Bay Beach is part of the Princess Alexandra National Park, which also includes the Bight Beach, Smith’s Reef, the Bight Reef (Coral Gardens), Leeward Beach, Little Water Cay, Half Moon Bay, and the eco-tour destination of Mangrove Cay.',
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
