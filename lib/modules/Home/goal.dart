import 'package:flutter/material.dart';

class MyGoal extends StatelessWidget {
  final String goalName;
  final num saving_amount;
  final num monthly_amount;

  const MyGoal(
      {Key? key,
      required this.goalName,
      required this.monthly_amount,
      required this.saving_amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(
        height: 200,
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  Icon(Icons.arrow_upward),
                Text(
                  "${goalName}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                //  Text("16%"),
              ],
            ),
            Row(
              children: [
                //   Icon(Icons.arrow_upward),
                // LinearProgressIndicator(
                //   value: 0.5 ,
                // ),

                // Column(
                //   children: [
                //     Text("saving"),
                //     Text(
                //       "${saving_amount}",
                //       style: TextStyle(color: Colors.green, fontSize: 20),
                //     ),
                //   ],
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\t Total "),
                Text(
                  "${saving_amount}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(0, 71, 147, 1),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
=======
      child:  Container(

      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(0, 71, 147, 200),),


      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.arrow_upward),
              Text(
                " Travel",
                style: TextStyle(color: Colors.black, fontSize: 20),

              ),

              Text ("+16%"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(value: 1 ,onChanged: (value){}
              ),
              Column(
                children: [

                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Total" , style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
              ),



              Text("10000SR" ,  style: TextStyle(color: Colors.black, fontSize: 20),),
            ],
          ),
        ],



      ),
    )
    );
  }
}
