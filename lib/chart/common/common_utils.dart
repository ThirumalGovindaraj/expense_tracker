
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonUtils{
  CommonUtils._();
  static Widget loadingWidget() {
    return Center(child: SpinKitDoubleBounce(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: index.isEven
                ? Theme.of(context)
                .primaryColor
                .withOpacity(0.4)
                : Theme.of(context).primaryColor,
          ),
        );
      },
    ));
  }
}