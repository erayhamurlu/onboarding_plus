library onboarding_plus;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'provider/onboarding_provider.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({
    super.key,
    required this.pageList,
    required this.pageWidth,
    required this.pageHeight,
    required this.backgroundColor,
    required this.skipButtonColor,
    required this.skipButtonTextStyle,
    required this.nextButtonTextStyle,
    required this.doneButtonTextStyle,
    required this.deactiveDotColor,
    required this.activatedDotColor,
    required this.nextButtonColor,
    required this.onPressedSkip,
    required this.onPressedDone,
  });
  List<dynamic> pageList = [];
  Color backgroundColor;
  Color skipButtonColor;
  Color deactiveDotColor;
  Color activatedDotColor;
  Color nextButtonColor;
  TextStyle skipButtonTextStyle;
  TextStyle nextButtonTextStyle;
  TextStyle doneButtonTextStyle;
  double pageWidth;
  double pageHeight;
  VoidCallback onPressedSkip;
  VoidCallback onPressedDone;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: widget.backgroundColor,
            child: SizedBox(
              // width: widget.pageWidth,
              height: widget.pageHeight - 110,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pageList.length,
                itemBuilder: (context, index) {
                  return widget.pageList[index];
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value.toDouble();
                  });
                },
              ),
            ),
          ),
          //? Bottom Row
          Container(
            color: widget.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //? Skip
                InkWell(
                    onTap: widget.onPressedSkip,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.skipButtonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Text(
                        "Skip",
                        style: widget.skipButtonTextStyle,
                      ),
                    )),
                //? Dots
                DotsIndicator(
                  dotsCount: widget.pageList.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: widget.deactiveDotColor,
                    activeColor: widget.activatedDotColor,
                  ),
                ),
                //? Next & Done
                InkWell(
                  onTap: currentIndex != (widget.pageList.length - 1) ? nextPage : widget.onPressedDone,
                  child: Container(
                      decoration: BoxDecoration(
                        color: widget.nextButtonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: currentIndex == (widget.pageList.length - 1)
                          ? Text(
                              "Done",
                              style: widget.doneButtonTextStyle,
                            )
                          : Text(
                              "Next",
                              style: widget.nextButtonTextStyle,
                            )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void nextPage() {
    currentIndex = currentIndex + 1;
    _pageController.animateToPage(currentIndex.toInt(), duration: const Duration(milliseconds: 500), curve: Curves.easeInBack);
  }
}
