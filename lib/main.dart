import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TravelStoriesPage(),
  ));
}

class TravelStoriesPage extends StatefulWidget {
  const TravelStoriesPage({super.key});

  @override
  State<TravelStoriesPage> createState() => _TravelStoriesPageState();
}

class _TravelStoriesPageState extends State<TravelStoriesPage> {
  final List<String> categories = ['For You', 'Trending', 'News', 'Travel', 'Food'];
  String selectedCategory = 'For You';

  final Map<String, Map<String, List<Map<String, dynamic>>>> categoryContent = {

    'For You': {
      'left': [
        {'title': 'Morning\nCoffee', 'img': 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800', 'h': 240.0},
        {'title': 'Urban\nStreets', 'img': 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=800', 'h': 350.0},
      ],
      'right': [
        {'title': 'City\nNight', 'img': 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=800', 'h': 380.0},
        {'title': 'Autumn\nRoad', 'img': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800', 'h': 220.0},
      ],
    },

 
    'Trending': {
      'left': [
        {'title': 'Wild\nForest', 'img': 'https://images.unsplash.com/photo-1511497584788-876760111969?w=800', 'h': 260.0},
        {'title': 'Foggy\nTrees', 'img': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800', 'h': 300.0},
        {'title': 'Green\nValley', 'img': 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800', 'h': 240.0},
      ],
      'right': [
        {'title': 'Ice\nMountain', 'img': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800', 'h': 300.0},
        {'title': 'Snow\nPeak', 'img': 'https://images.unsplash.com/photo-1482192596544-9eb780fc7f66?w=800', 'h': 280.0},
      ],
    },


    'News': {
      'left': [
        {'title': 'Daily\nUpdate', 'img': 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=800', 'h': 280.0},
        {'title': 'Breaking\nNews', 'img': 'https://images.unsplash.com/photo-1585241936939-be4099591252?w=800', 'h': 260.0},
        {'title': 'Media\nPress', 'img': 'https://images.unsplash.com/photo-1581090700227-1e37b190418e?w=800', 'h': 240.0},
      ],
      'right': [
        {'title': 'World\nReport', 'img': 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800', 'h': 300.0},
        {'title': 'Global\nStory', 'img': 'https://images.unsplash.com/photo-1529070538774-1843cb3265df?w=800', 'h': 260.0},
      ],
    },


    'Travel': {
      'left': [
        {'title': 'Beach\nEscape', 'img': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 'h': 260.0},
        {'title': 'Island\nTrip', 'img': 'https://picsum.photos/600/900?random=21', 'h': 300.0},
        {'title': 'Sunset\nView', 'img': 'https://images.unsplash.com/photo-1501973801540-537f08ccae7b?w=800', 'h': 240.0},
      ],
      'right': [
        {'title': 'Mountain\nTrip', 'img': 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800', 'h': 320.0},
        {'title': 'Road\nJourney', 'img': 'https://picsum.photos/600/800?random=22', 'h': 260.0},
      ],
    },


    'Food': {
      'left': [
        {'title': 'Street\nFood', 'img': 'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?w=800', 'h': 260.0},
        {'title': 'Coffee\nBreak', 'img': 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800', 'h': 240.0},
        {'title': 'Fresh\nSalad', 'img': 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800', 'h': 220.0},
      ],
      'right': [
        {'title': 'Fine\nDining', 'img': 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800', 'h': 300.0},
        {'title': 'Dessert\nTime', 'img': 'https://picsum.photos/600/850?random=23', 'h': 260.0},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final leftData = categoryContent[selectedCategory]!['left']!;
    final rightData = categoryContent[selectedCategory]!['right']!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'SliverAppBar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image.network(
                'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=1200',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyCategoryDelegate(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isActive = selectedCategory == cat;

                    return GestureDetector(
                      onTap: () => setState(() => selectedCategory = cat),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.black : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          cat,
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: leftData.map((item) => StaticGridBox(
                        title: item['title'],
                        imageUrl: item['img'],
                        height: item['h'],
                      )).toList(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: rightData.map((item) => StaticGridBox(
                        title: item['title'],
                        imageUrl: item['img'],
                        height: item['h'],
                      )).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StaticGridBox extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double height;

  const StaticGridBox({super.key, required this.title, required this.imageUrl, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 15, 
              right: 15,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyCategoryDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _StickyCategoryDelegate({required this.child});

  @override double get minExtent => 60;
  @override double get maxExtent => 60;
  @override Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;
  @override bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
