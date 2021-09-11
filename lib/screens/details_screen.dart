import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/pexels-magda-ehlers-1337372.jpg"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Practice",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Get Better",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Don’t stress. Do your best. Forget the rest",
                      ),
                    ),
                    //SizedBox(
                    //  width: size.width * .5, // it just take the 50% width
                    //  child: SearchBar(),
                    // ),
                    SizedBox(height: 30.0),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        for (int a = 0; a < 5; a++)
                          SeassionCard(
                            seassionNum: a,
                            isDone: true,
                            press: () {
                              Get.to(QuizScreen(1));
                            },
                          )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Gss Summary",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    for (int k = 0; k < 5; k++)
                      InkWell(
                        onTap: () {
                          print("Container clicked$k");
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.all(10),
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              //SvgPicture.asset(
                              //  "assets/icons/Meditation_women_small.svg",
                              // ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Basic 2",
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Text("D")
                                  ],
                                ),
                              ),
                              //Padding(
                              //padding: EdgeInsets.all(10),
                              //child: SvgPicture.asset("assets/icons/Lock.svg"),
                              //),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    Text(
                      "Past Questions",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < 5; i++)
                      InkWell(
                        onTap: () {
                          print("Container $i");
                        }, // Handle your callback
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.all(10),
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              //SvgPicture.asset(
                              //  "assets/icons/Meditation_women_small.svg",
                              // ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Basic 2",
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Text("D")
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(10),
                              //   child: SvgPicture.asset("assets/icons/Lock.svg"),
                              // ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Colors.white,
              ),
            ],
          ),
          child: Material(
            color: Colors.black,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? Colors.purple[500] : Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : Colors.purple[500],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session  $seassionNum",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
