import 'package:flutter/material.dart';



class MyGoal extends StatelessWidget {
  const MyGoal({Key? key}) : super(key: key);

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
                Icon(Icons.arrow_upward),
                Text(
                  " travel",
                  style: TextStyle(color: Colors.black, fontSize: 20),

                ),

                Text ("16%"),
              ],
            ),
         
            Row(
              children: [
                Icon(Icons.arrow_upward),
                Column(
                  children: [
                    Text("saving"),
                    Text("mm"  ,style: TextStyle(color: Colors.green, fontSize: 20),),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

               Text("total"),



                    Text("mmmm" ,  style: TextStyle(color: Colors.red, fontSize: 20),),
                  ],
                ),
              ],


        ),
      ),
    );
  }
}
