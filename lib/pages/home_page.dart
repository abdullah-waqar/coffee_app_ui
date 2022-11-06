import 'package:cofee_ui/util/coffee_tile.dart';
import 'package:cofee_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// lsit of coffee types
  final List coffeeType = [
    // [coffe type , isSelected]
    ['Cappucino', true],

    ['Latte', false],

    ['Black', false],

    ['Tea', false],
  ];
// user tapped on coffee types

  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false

      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[700],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          // Find The best coffe for you

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Find the best cofee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          // Search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your cofee..",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // horizontal listview of coffee types

          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                }),
          ),

          // horizontal listview of coffee tiles

          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                  coffeeImagePath: 'lib/images/img1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.00'),
              CoffeeTile(
                  coffeeImagePath: 'lib/images/img2.jpg',
                  coffeeName: 'Black',
                  coffeePrice: '3.20'),
              CoffeeTile(
                  coffeeImagePath: 'lib/images/img3.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.40'),
            ],
          ))
        ],
      ),
    );
  }
}
