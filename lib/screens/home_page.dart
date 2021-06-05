import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../blocs/theme.dart';

bool lighttheme = false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.coronavirus_sharp,
            color: lighttheme ? Colors.white : Colors.black),
        actions: appbarActions(_themechanger),
        centerTitle: true,
        title: AutoSizeText(
          "Covid-19 Tracker",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: lighttheme ? Colors.white : Colors.black,
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

  List<Widget> appbarActions(ThemeChanger _themechanger) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.brightness_6,
          color: lighttheme ? Colors.white : Colors.black,
        ),
        onPressed: () {
          lighttheme ? _themechanger.lightTheme() : _themechanger.darkTheme();
          if (lighttheme == true) {
            lighttheme = false;
          } else {
            lighttheme = true;
          }
        },
      ),
      IconButton(
        icon: Icon(
          Icons.info,
          color: lighttheme ? Colors.white : Colors.black,
        ),
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
      )
    ];
  }
}
