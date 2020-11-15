import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shg/localization/localization_constants.dart';
import 'OtpVerify.dart';

class SignInPage extends StatefulWidget {
  final String name;
  SignInPage(this.name);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String aphone, phone, errorText;
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    final enter = Text(
      getTranslated(context, 'labelno'),
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
    );
    final mobileField = TextField(
      obscureText: false,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onChanged: (value) => {this.aphone = value, this.phone = "+91" + value},
      decoration: InputDecoration(
          errorText: _validate ? errorText : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: getTranslated(context, 'edit_mobile'),
          prefixIcon: Icon(Icons.phone_iphone),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _sendToNext,
        child: Text(
          getTranslated(context, 'btn_get_otp'),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(getTranslated(context, 'shg')),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  enter,
                  SizedBox(height: 30.0),
                  mobileField,
                  SizedBox(
                    height: 30.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _sendToNext() {
    if (aphone == '' || aphone == null) {
      setState(() {
        _validate = true;
        errorText = 'Value Can\'t Be Empty';
      });
    } else if (aphone.length < 10) {
      setState(() {
        errorText = 'The number must be 10 digit';
        _validate = true;
      });
    } else {
      setState(() {
        _validate = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerify(widget.name, phone)),
      );
    }
  }
}
