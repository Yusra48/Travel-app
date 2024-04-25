import 'package:flutter/material.dart';

class CompletedPlaces extends StatelessWidget {
  const CompletedPlaces(
      {super.key, required List<Map<String, String>> mySpace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: mySpace.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: const Color(0xEDFFFFFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                  )
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(mySpace[index]['image']!),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mySpace[index]['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          mySpace[index]['description']!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '16 Jan',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey),
                          child: const Text(
                            'Book Again',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
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
}

List<Map<String, String>> mySpace = [
  {
    'name': 'Capadocia,Istanbul',
    'description':
        'A historical region in Turkey known for its unique landscape.',
    'image':
        'https://static.independent.co.uk/2023/08/31/12/iStock-1484200613.jpg?quality=75&width=1250&crop=3%3A2%2Csmart&auto=webp',
  },
  {
    'name': 'Gyeongbokgung Palace,Seoul',
    'description':
        'Gyeongbokgung Palace, was the main royal palace of the Joseon dynasty. Built in 1395, it is located in northern Seoul, South Korea. The largest of the Five Grand Palaces built by the Joseon dynasty',
    'image':
        'https://lh3.googleusercontent.com/p/AF1QipO3bYLWEVNK3Ymr6af7CXHw4aqHtt8c2JvHdImn=s680-w680-h510',
  },
  {
    'name': ' Aurora borealis, Ireland',
    'description':
        'An aurora, also commonly known as the northern lights or southern lights, is a natural light display in Earths sky, predominantly seen in high-latitude regions',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Church_of_light.jpg/1024px-Church_of_light.jpg',
  },
  {
    'name': 'Global Village,Dubai',
    'description':
        'Global Village is a shopping, dining, and entertainment attraction located on Sheikh Mohammed Bin Zayed Road (E 311 road) in Dubai, United Arab Emirates',
    'image':
        'https://cdn.getyourguide.com/img/tour/bed872846b6c9714.jpeg/145.jpg',
  },
];
