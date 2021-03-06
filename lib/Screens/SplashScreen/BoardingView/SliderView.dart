import 'dart:async';

import 'package:bellava/Screens/SplashScreen/BoardingView/sliderDots.dart';
import 'package:bellava/Screens/SplashScreen/BoardingView/sliderItems.dart';
import 'package:flutter/material.dart';
import 'package:bellava/Utils/TextStyle.dart';
import 'package:bellava/Utils/consts.dart';

import 'Slider.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _onPageChanged(int index) async => setState(() {
      _currentPage = index;
    });

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: sliderArrayList.length,
              itemBuilder: (ctx, i) => SlideItem(i),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                //     child: BoldText(NEXT,14,kblack),

                //   ),
                // ),


                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                //     child: BoldText(SKIP,14,kblack),

                //   ),
                // ),


                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                      [for (int i = 0; i < sliderArrayList.length; i++)
                      if (i == _currentPage)
                         SlideDots(true) else  SlideDots(false)]
                    
                  ),
                ),
              ],
            )
          ],
        )),
  );
}