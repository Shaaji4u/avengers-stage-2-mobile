import 'package:brainy/page/questions_page.dart';
import 'package:brainy/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  route({routeTo, context}) {
    if (routeTo == "welcome") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => QuestionsPage(username: "username")));
    } else if (routeTo == "IQTest") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => QuestionsPage(username: "username")));
    }else{
      // alert no route found
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientBg),
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: Stack(children: <Widget>[
          Positioned(
            width: mediaQuery.size.width,
            left: 10,
            top: 50,
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Welcome",
                  style: Theme.of(context).textTheme.headline1),
              TextSpan(
                  text: "\n \t\t Shaaji Bemshima",
                  style: Theme.of(context).textTheme.headline2),
            ])),
          ),
          Positioned(
              top: mediaQuery.size.height / 4,
              left: mediaQuery.size.width / 10,
              width: mediaQuery.size.width * .8,
              child: ClipPath(
                clipper: ShapeClipper(),
                child: Container(
                  width: mediaQuery.size.width * .8,
                  height: mediaQuery.size.height * .65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryVariant,
                        ]),
                  ),
                ),
              )),
          Positioned(
            top: mediaQuery.size.height * .23,
            left: mediaQuery.size.width * .2,
            child: Image(
              width: 230,
              height: 230,
              image: ExactAssetImage("assets/brain.png"),
            ),
          ),
          Positioned(
            width: mediaQuery.size.width * .7,
            top: mediaQuery.size.height * .58,
            left: mediaQuery.size.width * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "To help Evaluate your IQ,\ni will be asking some random questions. Your response will be used in evaluating you",
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, fontFamily: 'Lato'),
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * .2),
              ],
            ),
          ),
          Positioned(
            width: mediaQuery.size.width * .7,
            top: mediaQuery.size.height * .8,
            left: mediaQuery.size.width * .15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).colorScheme.error,
                  textColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: ()=>route(routeTo: "welcome", context: context),
                  child: Text("Close"),
                ),
                RaisedButton(

                  color: Colors.green,
                  textColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: ()=>route(routeTo: "IQTest", context: context),
                  child: Text("Begin"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * .33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundnessFactor * 3, roundnessFactor * 2);
    path.lineTo(roundnessFactor, size.height * .33 + 10);
    path.quadraticBezierTo(0, size.height * 0.33 + roundnessFactor, 0,
        size.height * .33 + roundnessFactor * 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}