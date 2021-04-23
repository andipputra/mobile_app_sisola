import 'package:flutter/material.dart';

class BottomSheetContainer {

  BottomSheetContainer(this.context);

  BuildContext context;

  void showDialog(Widget content) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      builder: (context) => content
    );
  }
}
