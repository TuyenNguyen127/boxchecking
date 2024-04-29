import 'package:flutter/material.dart';

import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;

  bool isLast;
  StepperComponent({
    // super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //this is the bubble
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? Colors.transparent
                            : appTheme.redA200,
                        border: Border.all(
                          width: 2,
                          color: currentIndex >= index
                              ? theme.colorScheme.primary
                              : Colors.black38,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: currentIndex == index
                                ? theme.colorScheme.primary
                                : theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //this the ligne
                  Container(
                    height: 2,
                    //why index+1 we want to turn the ligne orange that precede the active bubble
                    color: currentIndex >= index + 1
                        ? appTheme.redA200
                        : Colors.black38,
                  ),
                ],
              ),
              //index+1 we dont wanna show 0 in the screen since our index will start at 0
              // Container(
              //   // margin: EdgeInsets.only(right: 10),
              //   decoration: BoxDecoration(color: Colors.amber),
              //   child: Center(
              //     child: Text('checking and payment ${index + 1}'),
              //   ),
              // ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index == currentIndex
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                          border: Border.all(
                            width: 2,
                            color: currentIndex >= index
                                ? theme.colorScheme.primary
                                : Colors.black38,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: currentIndex > index
                                  ? theme.colorScheme.primary
                                  : (index == currentIndex
                                      ? appTheme.redA200
                                      : theme.colorScheme.primary),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //this the ligne
                    Expanded(
                      child: Container(
                        height: 2,
                        //why index+1 we want to turn the ligne orange that precede the active bubble
                        color: currentIndex >= index + 1
                            ? theme.colorScheme.primary
                            : Colors.black38,
                      ),
                    ),
                  ],
                ),
                //index+1 we dont wanna show 0 in the screen since our index will start at 0
                // Text('Page ${index + 1}'),
              ],
            ),
          );
  }
}
