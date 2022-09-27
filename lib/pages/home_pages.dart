import 'package:coffeeapp/util/coffee_tile.dart';
import 'package:coffeeapp/util/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List ct =[
    // coffee type, isSelected
    ['Cappucino',true],
    ['Latte',false],
    ['Black',false],
    ['Tea',false],

  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index){
    setState(() {

      // this  for loop make every selection false
      for(int i = 0; i <ct.length;i++) {
        ct[i][1] = false;
      }
      ct[index][1] = true;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
               label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ""),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text('Find best coffee for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find your coffee...',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // horizontal listview of coffee types
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ct.length,
                    itemBuilder: (context,index){
                  return CoffeeType(coffeeType: ct[index][0],
                      isSelected: ct[index][1], onTap: (){
                        coffeeTypeSelected(index);
                  });
                })
              ),

              // horizontal listview of coffee tiles
              Container(
                // color: Colors.green,
                alignment: Alignment.topCenter,
                height: 350,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeTile(
                      coffeeImagePath: 'images/pexels5.jpg',
                      coffeeName: 'Latte',
                      coffeePrice: '4.20',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'images/pexels1.jpg',
                      coffeeName: 'Cappucino',
                      coffeePrice: '4.60',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'images/pexels2.jpg',
                      coffeeName: 'Milk coffee thing',
                      coffeePrice: '4.40',
                    ),

                  ],
                ),
              ),


              //Find the best coffee for you


              //Scearch bar

              //horizontal listview for tiles
            ],
          ),
        ),
      ),

    );
  }
}
