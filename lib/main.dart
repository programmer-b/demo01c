import 'package:demo01c/drawer.dart';
import 'package:demo01c/landing_page_bg_image.dart';
import 'package:demo01c/strings.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              iconTheme: IconThemeData(color: Colors.white))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget?> _children = [
    Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.network(
          officialLogoUrl,
          width: double.infinity * 0.7,
          fit: BoxFit.fitWidth,
        ))
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: const MyDrawer(),
        appBar: AppBar(
            actions: [Container()],
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      appBarLogoUrl,
                      width: width * 0.7,
                      fit: BoxFit.fitWidth,
                    ),
                    InkWell(
                      onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
                      child: Image.asset(
                          "assets/images/icons8-grip-lines-vertical-32.png"),
                    )
                  ],
                ),
              ],
            )),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          children: [
            40.height,
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.network(
                  officialLogoUrl,
                  width: double.infinity * 0.7,
                  fit: BoxFit.fitWidth,
                )),
            40.height,
            const LandingPage()
          ],
        ));
  }
}
