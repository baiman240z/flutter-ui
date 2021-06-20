import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'classes/util.dart';
import 'classes/password.dart';
import 'classes/formatter.dart';

class TextFields extends StatefulWidget {
  @override
  TextFieldsState createState() => new TextFieldsState();
}

class TextFieldsState extends State<TextFields> {
  final _mobileNumberFormatter = MobileNumberFormatter();
  final _trimFormatter = TrimFormatter();
  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields'),
      ),
      body: _build(context),
      drawer: Util.drawer(context),
    );
  }

  Widget _build(BuildContext context) {
    int _passwordLen = 12;
    return Form(
      key: _formKey,
      autovalidate: false,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          SizedBox(height: 20.0,),
          // -------------------------------------------------------------
          // Simple
          // -------------------------------------------------------------
          TextField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.yellow, width: 1.0),
              ),
              filled: true,
              fillColor: Color(0xFFFFFFCC),
              labelText: 'Simple field',
              labelStyle: TextStyle(color: Colors.orange),
              hintText: 'Please input something.',
            ),
            style: TextStyle(
              fontSize:18.0,
              color: const Color(0xFF000000),
            ),
          ),

          SizedBox(height: 20.0,),
          // -------------------------------------------------------------
          // Tel
          // -------------------------------------------------------------
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '',
            ),
            keyboardType: TextInputType.phone,
            onSaved: (String value) { print('saved: $value'); },
            validator: (String value) {
              if (value.length == 0) { return null; }
              final RegExp regexp = RegExp(r'^\d\d\d-\d\d\d\d\-\d\d\d\d$');
              if (!regexp.hasMatch(value))
                return '###-####-#### - Enter a mobile phone number.';
              return null;
            },
            inputFormatters: <TextInputFormatter> [
              WhitelistingTextInputFormatter.digitsOnly,
              // Fit the validating format.
              _mobileNumberFormatter,
            ],
          ),

          SizedBox(height: 20.0,),
          // -------------------------------------------------------------
          // Email
          // -------------------------------------------------------------
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: const Icon(
                    Icons.person_outline,
                    color: Colors.green,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.green,
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.green.withOpacity(0.8)),
                      prefixText: '',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) { print('saved: $value'); },
                    validator: (String value) {
                      if (value.length == 0) { return null; }
                      final RegExp regex = RegExp(r'^[0-9a-z\.\-_]+@[0-9a-z\.\-_]+$');
                      if (!regex.hasMatch(value)) {
                        return 'Enter a valid email address.';
                      }
                      return null;
                    },
                    inputFormatters: <TextInputFormatter> [
                      _trimFormatter,
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0,),
          // -------------------------------------------------------------
          // Password
          // -------------------------------------------------------------
          PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: 'No more than $_passwordLen characters.',
            labelText: 'Password *',
            onFieldSubmitted: (String value) {
              setState(() {
                print(value);
              });
            },
            maxLength: _passwordLen,
          ),

          SizedBox(height: 20.0,),
          // -------------------------------------------------------------
          // validate button
          // -------------------------------------------------------------
          ElevatedButton(
            onPressed: () {
              _formKey.currentState.validate();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.indigo,
              elevation: 16.0,
            ),
            child: const Text(
              'validate',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
