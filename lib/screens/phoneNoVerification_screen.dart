import 'package:flutter/material.dart';
import 'package:registration_form/screens/otp_screen.dart';

class PhoneNumberVerification extends StatefulWidget {
  const PhoneNumberVerification({Key? key}) : super(key: key);

  @override
  _PhoneNumberVerificationState createState() =>
      _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  final TextEditingController phoneNumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // phone number field
    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: phoneNumberController,
      keyboardType: TextInputType.phone, maxLength: 11,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator

      validator: (value) {
        RegExp regex = new RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
        if (value!.isEmpty) {
          return ("Phone Number is required for login");
        } else if (!regex.hasMatch(value)) {
          return ("Enter valid Phone Number");
        } else if (value.length != 11) {
          return ("Mobile Number must be of 10 digit");
        }
        return null;
      },
      onSaved: (value) {
        // this.phone =
        //     isCountryCodeSelected ? "+" + countryCode + value! : "+91" + value!;
        phoneNumberController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    // send OTP button
    final sendOtpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OTPScreen(phoneNumberController.text)));
          },
          child: Text(
            "Send OTP",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              //passing this to our root
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                // key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      phoneNumberField,
                      SizedBox(height: 5),
                      sendOtpButton,
                      SizedBox(height: 15),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
