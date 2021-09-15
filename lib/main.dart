import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 120.0, bottom: 120.0),
                child: SvgPicture.asset('assets/6clogo.svg',
                    width: 100, height: 60)),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Something',
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                child: Text('Enter something here',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text(
                  'Enter',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
