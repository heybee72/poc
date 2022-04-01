import 'package:flutter/material.dart';

//loading indiacator
loadingDialog(context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(
                color: Colors.white,
                // strokeWidth: 2.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: -0.08),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    },
  );
}

//alart dialog
Future<void> openDialog(
  context,
  String title,
  String message,
  VoidCallback? confirm,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 17,
                letterSpacing: -0.41),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13,
                letterSpacing: -0.08),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: confirm,
                child: const Text(
                  'OK',
                  style: TextStyle(
                      color: Color.fromARGB(255, 49, 36, 94),
                      fontWeight: FontWeight.w900,
                     
                      fontSize: 17,
                      letterSpacing: -0.41),
                ))
          ],
        );
      });
}
