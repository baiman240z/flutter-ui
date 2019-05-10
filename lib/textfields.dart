import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'parts/sidemenu.dart';
import 'parts/password.dart';
import 'parts/formatter.dart';

class TextFields extends StatefulWidget {
  @override
  TextFieldsState createState() => new TextFieldsState();
}

class TextFieldsState extends State<TextFields> {
  double sliderValue;
  Map<String, bool> checks;

  final _mobileNumberFormatter = MobileNumberFormatter();
  final _trimFormatter = TrimFormatter();
  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    sliderValue = 0.1;
    checks = {
      'cat': false,
      'dog': false,
      'pig': false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields'),
      ),
      body: _build(context),
      drawer: SideMenu.drawer(context),
    );
  }

  Widget _build(BuildContext context) {
    int _passwordLen = 12;
    return SafeArea(
      child: Form(
        key: _formKey,
        autovalidate: false,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: <Widget>[
            // -------------------------------------------------------------
            // Simple
            // -------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFCC),
                  labelText: 'Simple field',
                  hintText: 'Please input something.',
                ),
                style: TextStyle(
                  fontSize:18.0,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            // -------------------------------------------------------------
            // Tel
            // -------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
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
            ),
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
              margin:
              const EdgeInsets.symmetric(vertical: 10.0),
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

            // -------------------------------------------------------------
            // Password
            // -------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: PasswordField(
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
            ),

            // -------------------------------------------------------------
            // validate button
            // -------------------------------------------------------------
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
                color: Color(0xFF4aa0d5),
                splashColor: Colors.yellow,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      "validate",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                onPressed: () {
                  _formKey.currentState.validate();
                },
              ),
            ),

          ],
        ),
      )
    );
  }
}
