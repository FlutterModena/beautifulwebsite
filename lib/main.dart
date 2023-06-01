import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetsResponsiveDesign = [];
  Map<String, String> responsiveDesign = {
    "Expanded":
        "A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.",
    "Flexible":
        "A widget that controls how a child of a Row, Column, or Flex flexes.",
    "AspectRatio":
        "A widget that attempts to size the child to a specific aspect ratio."
  };

  Map<String, String> rightWidgets = {
    "Row": "A widget that displays its children in a horizontal array.",
    "Column": "A widget that displays its children in a vertical array.",
    "ListView": "A scrollable list of widgets arranged linearly.",
    "GridView": "A scrollable, 2D array of widgets.",
    "Stack":
        "A widget that positions its children relative to the edges of its box.",
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 64.0,
                      right: 36.0,
                      left: 36.0,
                    ),
                    child: Text(
                      "Beautiful\nWebsite",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        fontSize: 72.0,
                        letterSpacing: 0.5
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 16.0,
                      right: 36.0,
                      left: 36.0,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "This web was designed to graphically demonstrate\nthe ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.15,
                          fontSize: 22.0,
                        ),
                        children: [
                          TextSpan(
                            text: 'most common mistakes',
                            style: TextStyle(
                              height: 1.5,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 22.0,
                            ),
                          ),
                          TextSpan(
                            text: ' best practices',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          TextSpan(
                            text: "\nmade by new Web Page designers.",
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 48.0,
                      bottom: 64.0,
                    ),
                    child: FilledButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(36.0))),
                      onPressed: () => print("AAA"),
                      child: Text(
                        "No famous soap opera",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              margin: EdgeInsets.all(24.0),
            ),
            section("Responsive Design", width, responsiveDesign),
            section("Right Widgets", width, rightWidgets),
          ],
        ),
      ),
    );
  }

  Widget section(String title, double width, Map<String, String> map) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 72.0, right: 72.0, top: 72.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 72.0, right: 72.0, top: 16.0),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width >= 1024 ? 3 : 2,
            ),
            children: respDes(map),
          ),
        ),
      ],
    );
  }

  List<Widget> respDes(Map<String, String> map) {
    List<Widget> widgets = [];

    map.forEach((title, description) {
      Widget widget = Container(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 36.0,
                  left: 36.0,
                  right: 36.0,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(36.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      );

      widgets.add(widget);
    });

    return widgets;
  }
}
