<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package provide easily create onboarding page.

## Features

You can edit colors and text styles.

|Image1 | Image2| GIF |
|---|---|---|
|<img src="https://github.com/erayhamurlu/onboarding_plus/raw/main/screenshot1.png" width="238" height="500">|<img src="https://github.com/erayhamurlu/onboarding_plus/raw/main/screenshot2.png" width="238" height="500">|<img src="https://github.com/erayhamurlu/onboarding_plus/raw/main/gif1.gif" width="238" height="500">|

## Getting started

Add in your pubspec.yaml file lastest version of onboarding_plus

## Usage

Call this widget in body OnboardingViewer()

```dart
@override
  Widget build(BuildContext context) {
    return OnboardingViewer(
      pageList: onboardingList,
      pageWidth: MediaQuery.of(context).size.width, 
      pageHeight: MediaQuery.of(context).size.height, 
      backgroundColor: Colors.black,
      skipButtonColor: Colors.purple,
      skipButtonTextStyle: const TextStyle(color: Colors.white),
      nextButtonTextStyle: const TextStyle(color: Colors.white),
      doneButtonTextStyle: const TextStyle(color: Colors.white),
      deactiveDotColor: Colors.black,
      activatedDotColor: Colors.purple,
      nextButtonColor: Colors.purple,
      onPressedSkip: onPressedSkip,
      onPressedDone: onPressedDone,
      dotSize: Size(12, 12),
      bottomPadding: 110, 
      topPadding: 0,
      borderColor: Colors.purple,
      borderWidth: 1,
    );
  }
```

## Additional information

For more information you can follow developer on pub.dev

