import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
  ];

  int currentImageNumber = 0;
  showNextImage() {
    if (currentImageNumber < imagePaths.length - 1) {
      setState(() {
        currentImageNumber++;
      });
    } else if (currentImageNumber == imagePaths.length - 1) {
      setState(() {
        currentImageNumber = 0;
      });
    }
  }

  showPreviousImage() {
    if (currentImageNumber > 0) {
      setState(() {
        currentImageNumber--;
      });
    } else if (currentImageNumber == 0) {
      setState(() {
        currentImageNumber = imagePaths.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Slider'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    imagePaths[currentImageNumber],
                    //fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: showPreviousImage,
              child: Icon(
                Icons.navigate_before,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: showNextImage,
              child: Icon(
                Icons.navigate_next,
              ),
            ),
          ],
        ));
  }
}
