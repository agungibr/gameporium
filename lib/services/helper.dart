import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gameporium/services/textStyle.dart';

class Helper {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  // showHelpDialog(context, title, content, action)
  static Future<void> showHelpDialog(
    BuildContext context,
    String title,
    String content,
    String action,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            title,
            style: CustomTextStyle.text(16, FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                  style: CustomTextStyle.text(14, FontWeight.normal),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                action,
                style: CustomTextStyle.text(14, FontWeight.normal),
              ),
            ),
          ],
        );
      },
    );
  }
}
