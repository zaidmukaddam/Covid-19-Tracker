import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationIcon: SvgPicture.asset(
                    "assets/corona_virus.svg",
                    width: 40,
                    height: 40,
                  ),
                  applicationName: "Covid Tracker\n",
                  applicationVersion: 'v1.0.0',
                  applicationLegalese:
                      "This app tracks number of cases of corona across the globe.\n\nRepo: github.com/zaidmukaddam");
            },
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        title: AutoSizeText(
          "Covid-19 Tracker",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
      ),
      body: HomeCategories(),
    );
  }
}
