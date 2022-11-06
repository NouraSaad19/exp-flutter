import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Home/welcomepage.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'IMAGES/on_boarding1.png',
      title: 'جوّد ريالك',
      body: 'نساعدك في توثيق مصروفاتك وتتبع ادخاراتك وكل احتياجاتك المالية',
    ),
    BoardingModel(
      image: 'IMAGES/on_boarding2.png',
      title: 'ادخر أموالك',
      body: 'ادخل مبلغ الادخار الذي تريده وتابع تقدمك',
    ),
    BoardingModel(
      image: 'IMAGES/on_boarding3.png',
      title: 'تقارير لمصروفاتك',
      body: 'اطلع على تقارير شهرية أو سنوية لمصروفاتك',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(27, 255, 255, 255),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FWidget()),
              );
            },
            child: Text('تخطي',
                style: TextStyle(
                  color: Color.fromRGBO(0, 71, 147, 1),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Stack(
            children: [
              Positioned(
                child: Image(
                  image: AssetImage('IMAGES/on_boarding4.png'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Positioned(
                top: 70,
                right: 20,
                child: Text(
                  '${model.title}',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 32.0,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Positioned(
                top: 160,
                right: 25,
                child: Text(
                  '${model.body}',
                  style: TextStyle(
                      color: Color.fromRGBO(47, 205, 212, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 260, right: 10),
                    child: SmoothPageIndicator(
                      controller: boardController,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromRGBO(0, 71, 147, 1),
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      count: boarding.length,
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 260),
                    child: MaterialButton(
                      minWidth: 113,
                      color: Color.fromRGBO(0, 71, 147, 1),
                      onPressed: () {
                        if (isLast) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FWidget()),
                          );
                        } else {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "التالي",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      );
}
