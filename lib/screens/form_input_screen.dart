import 'package:flutter/material.dart';

class FormInputScreen extends StatefulWidget {
  const FormInputScreen({super.key});

  @override
  _FormInputScreenState createState() => _FormInputScreenState();
}

class _FormInputScreenState extends State<FormInputScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Input')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (value) {
                setState(() => _email = value ?? '');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Email saved: $_email'),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() => _email = '');
                        }),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  print('Email: $_email');
                }
              },
              child: Text('Submit'),
            ),
            Text('Email: $_email'),
          ],
        ),
      ),
    );
  }
}
