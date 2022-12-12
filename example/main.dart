import 'package:flutter/material.dart';
import 'package:onboarding_plus/onboarding_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Title",
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<dynamic> onboardingList = const [
    Onboarding1(),
    Onboarding1(),
  ];

  Future<void> onPressedSkip() async {}

  Future<void> onPressedDone() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnboardingView(
      pageList: onboardingList,
      pageWidth: MediaQuery.of(context).size.width, //context.width,
      pageHeight: MediaQuery.of(context).size.height, //context.height,
      backgroundColor: Colors.black,
      skipButtonColor: Colors.purple,
      skipButtonTextStyle: const TextStyle(color: Colors.white),
      nextButtonTextStyle: const TextStyle(color: Colors.white),
      doneButtonTextStyle: const TextStyle(color: Colors.white),
      deactiveDotColor: Colors.grey,
      activatedDotColor: Colors.purple,
      nextButtonColor: Colors.purple,
      onPressedSkip: onPressedSkip,
      onPressedDone: onPressedDone,
    ));
  }
}

class Onboarding1 extends StatelessWidget {
  const Onboarding1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: const [
      SizedBox(height: 80),
      Text("Industry. Lorem Ipsum"),
      SizedBox(height: 40),
      Text(" unknown printer took a galley of type and scrambled it to make "),
      SizedBox(height: 40),
      FlutterLogo(size: 100),
      SizedBox(height: 40),
    ]);
  }
}
