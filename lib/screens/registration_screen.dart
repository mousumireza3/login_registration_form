import 'package:flutter/material.dart';
import 'package:registration_form/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //Form Key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController secondNameController =
      new TextEditingController();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // First name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator : (){}
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator : (){}
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator : (){}
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // password field
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator : (){}
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // confirm password field
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

      // validator : (){}
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    // signUp button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text(
            "SignUp",
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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    firstNameField,
                    SizedBox(height: 25),
                    secondNameField,
                    SizedBox(height: 25),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    confirmPasswordField,
                    SizedBox(height: 35),
                    signUpButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
