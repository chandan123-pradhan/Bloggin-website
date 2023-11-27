import 'package:flutter/material.dart';

class UploadSuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('File Upload Successful'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Your file has been successfully uploaded.'),
            // Add more descriptive text if needed
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            
          },
        ),
      ],
    );
  }
}

void showUploadSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return UploadSuccessDialog();
    },
  );
}