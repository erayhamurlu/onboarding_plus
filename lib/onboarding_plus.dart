library onboarding_plus;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingViewer extends StatefulWidget {
  OnboardingViewer({
    super.key,
    required this.pageList,
    required this.pageWidth,
    required this.pageHeight,
    required this.dotSize,
    required this.borderWidth,
    required this.backgroundColor,
    required this.nextButtonColor,
    required this.skipButtonColor,
    required this.deactiveDotColor,
    required this.activatedDotColor,
    required this.borderColor,
    required this.skipButtonTextStyle,
    required this.nextButtonTextStyle,
    required this.doneButtonTextStyle,
    required this.onPressedSkip,
    required this.onPressedDone,
    required this.topPadding,
    required this.bottomPadding,
  });
  List<dynamic> pageList = [];
  double pageWidth;
  double pageHeight;
  double topPadding;
  double bottomPadding;
  double borderWidth;
  Size dotSize;
  Color backgroundColor;
  Color skipButtonColor;
  Color nextButtonColor;
  Color deactiveDotColor;
  Color activatedDotColor;
  Color borderColor;
  TextStyle skipButtonTextStyle;
  TextStyle nextButtonTextStyle;
  TextStyle doneButtonTextStyle;
  VoidCallback onPressedSkip;
  VoidCallback onPressedDone;

  @override
  State<OnboardingViewer> createState() => _OnboardingViewerState();
}

class _OnboardingViewerState extends State<OnboardingViewer> {
  final PageController _pageController = PageController();
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: widget.topPadding),
          Container(
            color: widget.backgroundColor,
            child: SizedBox(
              // width: widget.pageWidth,
              height: widget.pageHeight - widget.bottomPadding,
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
                    shape: CircleBorder(
                      side: BorderSide(width: widget.borderWidth, strokeAlign: StrokeAlign.inside, color: widget.borderColor),
                    ),
                    activeSize: widget.dotSize,
                    size: widget.dotSize,
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
