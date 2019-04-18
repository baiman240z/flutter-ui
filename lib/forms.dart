import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'parts/sidemenu.dart';
import 'parts/password.dart';
import 'parts/formatter.dart';

class Forms extends StatefulWidget {
  @override
  FormsState createState() => new FormsState();
}

class FormsState extends State<Forms> {
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
        title: Text('Forms'),
      ),
      body: _build(),
      drawer: SideMenu.drawer(context),
    );
  }

  Widget _buildCheckBox(String id, String text) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Checkbox(
            value: checks[id],
            onChanged: (bool value) {
              setState(() {
                checks[id] = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.green, fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _build() {
    int _passwordLen = 12;
    return SafeArea(
      child: Form(
        key: _formKey,
        autovalidate: false,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: <Widget>[
            // -------------------------------------------------------------
            // form field
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
            // Slider
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Slider(
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.deepOrange.withOpacity(0.2),
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
                value: sliderValue,
              ),
            ),

            // -------------------------------------------------------------
            // Checkbox
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  _buildCheckBox('cat', 'Cat'),
                  _buildCheckBox('dog', 'Dog'),
                  _buildCheckBox('pig', 'Pig'),
                ],
              ),
            ),

            // -------------------------------------------------------------
            // Simple Raised button
            // -------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                splashColor: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text(
                    'Simple Raised',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ),
                onPressed: () => {},
              ),
            ),

            // -------------------------------------------------------------
            // Simple Flat button
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
                      "Simple Flat",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                onPressed: () {
                  _formKey.currentState.validate();
                },
              ),
            ),

            // -------------------------------------------------------------
            // Decorated button
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                      color: Color(0xFF4aa0d5),
                      splashColor: Colors.yellow,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Decorated Flat",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Transform.translate(
                            offset: Offset(15.0, 0.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF4aa0d5),
                                ),
                                onPressed: () {
                                  _formKey.currentState.validate();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
