import 'package:baby_milestone_tracker/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreenConfig extends StatefulWidget {
  const IntroScreenConfig({super.key});

  @override
  State<IntroScreenConfig> createState() => _IntroScreenConfigState();
}

class _IntroScreenConfigState extends State<IntroScreenConfig> {
  List<ContentConfig> listContentConfig = [];
  Color activeColor = const Color(0xff0BEEF9);
  Color inactiveColor = const Color(0xff03838b);
  double sizeIndicator = 20;

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(fontFamily: 'Caveat', fontSize: 24),
        styleDescription: TextStyle(fontFamily: 'Caveat', fontSize: 18),
        title: "Baby Milestones Tracker!",
        description:
            "Congratulations on your parenting journey! Baby Milestones Tracker is here to help you cherish and record those special moments in your baby's development",
        pathImage: "assets/flutter.jpg",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        styleTitle:
            TextStyle(fontFamily: 'Caveat', fontSize: 24, color: Colors.white),
        styleDescription:
            TextStyle(fontFamily: 'Caveat', fontSize: 18, color: Colors.white),
        title: "Add your milestones:",
        description:
            "1. Tap the + button to add a new milestone.\n2. Choose the date and milestone type.\n3. Add any additional notes or photos.",
        pathImage: "assets/img2.jpg",
        backgroundColor: Color(0xff203152),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(
            fontFamily: 'Caveat', fontSize: 24, color: Colors.amberAccent),
        styleDescription: TextStyle(
            fontFamily: 'Caveat', fontSize: 18, color: Colors.amberAccent),
        title: "Why track milestones?",
        description:
            "- Celebrate your baby's growth journey.\n- Create a timeline of precious memories.\n- Easily share updates with family and friends.",
        pathImage: "assets/img1.jpg",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Dashboard()),
    );
  }

  void onNextPress() {
    // log("onNextPress caught");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      size: 25,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      size: 25,
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      size: 25,
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      foregroundColor: MaterialStateProperty.all<Color>(activeColor),
      backgroundColor: MaterialStateProperty.all<Color>(inactiveColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      // Content config
      listContentConfig: listContentConfig,
      backgroundColorAllTabs: Colors.grey,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Indicator
      indicatorConfig: IndicatorConfig(
        sizeIndicator: sizeIndicator,
        indicatorWidget: Container(
          width: sizeIndicator,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: inactiveColor),
        ),
        activeIndicatorWidget: Container(
          width: sizeIndicator,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: activeColor),
        ),
        spaceBetweenIndicator: 10,
        typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
      ),

      // Navigation bar
      navigationBarConfig: NavigationBarConfig(
        navPosition: NavPosition.bottom,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top > 0 ? 20 : 10,
          bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 20 : 10,
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),

      // Scroll behavior
      isAutoScroll: true,
      isLoopAutoScroll: true,
      curveScroll: Curves.bounceIn,
    );
  }
}
