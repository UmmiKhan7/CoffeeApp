import 'package:flutter/material.dart';
class CoffeeTile extends StatelessWidget {
final String coffeeImagePath;
final String coffeeName;
final String coffeePrice;


 CoffeeTile({
  required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const  EdgeInsets.only(bottom: 10),
        constraints: const BoxConstraints(
          maxHeight: 40
        ),
          height: 40,
          width: 250,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black54,


      ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               // coffee  image
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(12),
                     child: Image.asset(coffeeImagePath,fit: BoxFit.cover,  height: 200, width: double.infinity,)),
               ),
               // coffee name
               Padding(
                 padding: const EdgeInsets.only(left:12.0),
                 child:  Text(
                   coffeeName,
                   style: TextStyle(fontSize: 20),
                 ),
               ),
               SizedBox(height: 4,),
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Text(
                   'With Almond Milk',
                   style: TextStyle(color: Colors.grey[700]),
                 ),
               ),
               // price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(0.0),
                       child: Text('\$'+coffeePrice),
                     ),
                     Container(
                       padding: EdgeInsets.all(4),
                       decoration: BoxDecoration(color: Colors.orange,
                       borderRadius: BorderRadius.circular(6)),
                         child: Icon(Icons.add))
                   ],
               ),
                )
             ],
           ),
      ),
    );
  }
}
