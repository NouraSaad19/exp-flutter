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
        height: 188,
        width: 342,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(0, 71, 147, 1),
        ),
        child: Container(
          height: 159,
          width: 310,

          // color: Colors.blue[50],

          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("IMAGES/BACKGROUND.png"))),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " \t\t مجموع الدخل",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 188, 212, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                      width: 20,
                      margin: EdgeInsets.only(left: 30),
                      child: Image.asset("IMAGES/more.png")),
                ],
              ),
              Text(
                "\t \t \t\t\t\t$balance  " + "رس",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: (i1 >= i2 ? Colors.white : Colors.red)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("  "),
                      Container(
                          width: 20,
                          margin: EdgeInsets.only(left: 4),
                          child: Image.asset("IMAGES/loss.png")),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 110),
                            child: Text("\t \tالمصروفات",
                                style: TextStyle(
                                    color: Color.fromRGBO(244, 67, 54, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            child: Text(
                              "$spent رس",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Container(
                            width: 20,
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset("IMAGES/insert.png")),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text("الادخار",
                                style: TextStyle(
                                    color: Color.fromRGBO(138, 232, 142, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "$saving رس ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
