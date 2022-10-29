import 'package:flutter/material.dart';

class TopNewCard extends StatelessWidget {
  final String balance;
  final String saving;
  final String spent;

  TopNewCard(
      {Key? key,
      required this.balance,
      required this.saving,
      required this.spent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var i1 = double.parse(balance);
    var i2 = double.parse(spent);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 159,
        width: 310,
        // color: Colors.blue[50],
        decoration: BoxDecoration(

          image: DecorationImage(fit: BoxFit.fill,image: AssetImage("IMAGES/card.JPG")
          )

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              " Total Income",
              style: TextStyle( color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold , )
            ),
            Text(
              "$balance SR",
              style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold ,  color: (i1  >= i2 ?
              Colors.white
                  : Colors.red)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.monetization_on_outlined , color: Colors.white,),
                    Column(
                      children: [
                        Text("spent" ,style:  TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                        Text(
                          "$spent SR",
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(

                  children: [
                    Icon(Icons.monetization_on_outlined , color: Colors.white,),

                    Column(
                      children: [
                        Text("saving" ,style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                        Text(
                          "$saving SR",
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),




                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
