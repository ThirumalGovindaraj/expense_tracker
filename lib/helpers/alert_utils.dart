import 'package:flutter/material.dart';


class AlertUtils {
  AlertUtils._();

  static exitAlertWidget(BuildContext context,
      {String title="",
        String body="",
        String positiveText: "Yes",
        String negativeText: "No",
        bool barrierDismissible: false,
        VoidCallback? onPositivePress,
        VoidCallback? onNegativePress}) {
    // set up the button
    Widget positiveButton = FlatButton(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          color: Theme.of(context).primaryColor,
          child: Text(
            positiveText,
            style: const TextStyle(color: Colors.white),
          )),
      onPressed: onPositivePress,
    );
    Widget negativeButton = FlatButton(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          color: Theme.of(context).primaryColor,
          child: Text(
            negativeText,
            style: const TextStyle(color: Colors.white),
          )),
      onPressed: onNegativePress,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      content: Text(
        body,
      ),
      actions: [
        if (onPositivePress != null) positiveButton,
        if (onNegativePress != null) negativeButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialog(BuildContext context,
      {String title: "GOPAY 4.0",
        String body: "Something went wrong",
        VoidCallback? successClick}) async {
    bool isUnknownError =
    title.toLowerCase().contains("unknown") ? true : false;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
            isUnknownError
                ? "Oops. Seems like there's a problem"
                : title,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
        content: Text(
          /*isUnknownError ? "Our customer careline can help you." : */
            "$body"),
        actions: <Widget>[
          if (isUnknownError)
            FlatButton(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    "Contact Now",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: successClick ??
                      () {
                    Navigator.of(context).pop();
                    // launch('http://wa.me/60177353268');
                  },
            ),
          if (!isUnknownError)
            FlatButton(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    " OK ",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: successClick ??
                      () {
                    Navigator.of(context).pop();
                  },
            ),
        ],
      ),
    );
  }

  static playStoreAlertDialog(BuildContext context,
      {String title: "GOPAY 3.0",
        String body: "Something went wrong",
        VoidCallback? successClick}) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          /*isUnknownError ? "Our customer careline can help you." : */
            body),
        actions: <Widget>[
          FlatButton(
            child: Container(
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                child: const Text(
                  " Update ",
                  style: TextStyle(color: Colors.white),
                )),
            onPressed: successClick ??
                    () {
                  Navigator.of(context).pop();
                },
          ),
        ],
      ),
    );
  }

  static simpleAlertDialog(BuildContext context,
      {String title: "GOPAY 4.0",
        String body: "Something went wrong",
        VoidCallback? successClick}) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
        content: Text(
          /*isUnknownError ? "Our customer careline can help you." : */
            body),
        actions: <Widget>[
          FlatButton(
            child: Container(
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                child: const Text(
                  " OK ",
                  style: TextStyle(color: Colors.white),
                )),
            onPressed: successClick ??
                    () {
                  Navigator.of(context).pop();
                },
          ),
        ],
      ),
    );
  }

  /*static reportAlertDialog(BuildContext context,
      {String title: "GOPAY 4.0",
        String body: "Something went wrong",
        VoidCallback? viaWhatsApp,
        VoidCallback? reportViaMail}) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
        content: Text(
          *//*isUnknownError ? "Our customer careline can help you." : *//*
            body),
        actions: <Widget>[
          FlatButton(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5)),
                //color: Theme.of(context).primaryColor,
                child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [  Text(
                      "Ok",
                      style: TextStyle(color: Colors.white),
                    )])),
            onPressed:
                () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder:
                          (BuildContext context) =>
                      const SplashScreen()),
                  ModalRoute.withName(
                      OnBoardingScreen.tag));
            },
          ),
          FlatButton(
            child: Container(
                padding: const EdgeInsets.all(10),
                //color: Theme.of(context).primaryColor,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [ Text(
                      " Report Via WhatsApp ",
                      style: TextStyle(color: Colors.white),
                    )])),
            onPressed: viaWhatsApp ??
                    () {
                  Navigator.of(context).pop();
                },
          ), FlatButton(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5)),
                //color: Theme.of(context).primaryColor,
                child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [  Text(
                      " Report Via Mail ",
                      style: TextStyle(color: Colors.white),
                    )])),
            onPressed: reportViaMail ??
                    () {
                  Navigator.of(context).pop();
                },
          )
        ],
      ),
    );
  }*/
}
