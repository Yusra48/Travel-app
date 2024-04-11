import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/Popularpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2015/03/09/18/34/beach-666122_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/08/16/08/39/hallstatt-3609863_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/12/18/10/02/maldives-4703551_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/05/27/22/33/morocco-2349647_1280.jpg',
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // switch (index) {
    //   case 0:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomeScreen()),
    //     );
    //     break;
    //   case 1:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => ),
    //     );
    //     break;
    //   case 2:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const Notifications()),
    //     );
    //     break;
    //   case 3:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const ProfileView()),
    //     );
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xDCFFFFFF),
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.sort_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person_2_rounded),
          ),
        ],
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              ),
              SizedBox(width: 4),
              Text(
                'Karachi, Pakistan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [
          const Text(
            'Book your next trip to ?',
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 300,
            child: CarouselSlider.builder(
              itemCount: imageUrls.length,
              options: CarouselOptions(
                viewportFraction: 0.8,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              itemBuilder: (BuildContext context, int index, _) {
                final double scale =
                    (1 - (currentIndex - index).abs() * 0.2).clamp(0.0, 1.0);
                return Center(
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _buildCategoryItem(Icons.auto_awesome, 'Popular', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PopularPage()),
                    );
                  }),
                  _buildCategoryItem(Icons.bookmark, 'Most Visited', () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ),
                    // );
                  }),
                  _buildCategoryItem(Icons.waves, 'Islands', () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>),
                    // );
                  }),
                  _buildCategoryItem(Icons.location_city, 'Best Places', () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>),
                    // );
                  }),
                  _buildCategoryItem(Icons.beach_access, 'Beaches', () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ),
                    // );
                  }),
                  _buildCategoryItem(Icons.landscape, 'Mountains', () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ),
                    // );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 226,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 226,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                _buildImageCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2016/12/11/12/02/mountains-1899264_640.jpg',
                  location: 'Skardu',
                  starRating: 3.5,
                ),
                _buildImageCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2020/02/23/12/22/river-4873198_1280.jpg',
                  location: 'Turkey',
                  starRating: 4.5,
                ),
                _buildImageCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2019/12/18/10/02/maldives-4703551_1280.jpg',
                  location: 'Maldives',
                  starRating: 4.2,
                ),
                _buildImageCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2018/05/02/05/39/travel-3367783_640.jpg',
                  location: 'Bali',
                  starRating: 4.7,
                ),
                _buildImageCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2016/11/07/14/03/japan-1805865_960_720.jpg',
                  location: 'Japan',
                  starRating: 3.0,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

_buildCategoryItem(
  IconData icon,
  String text,
  VoidCallback onTapCallback,
) {
  return GestureDetector(
    onTap: onTapCallback,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.877),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 11),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildImageCard({
  required String imageUrl,
  required String location,
  required double starRating,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: 300,
    height: 270,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [BoxShadow(color: Colors.grey)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 139, left: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 145,
                left: 182,
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(
                      '$starRating stars',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
