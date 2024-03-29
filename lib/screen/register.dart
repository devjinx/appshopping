import 'package:fastsell/model/profile.dart';
import 'package:fastsell/screen/home.dart';
import 'package:fastsell/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "SIGN UP",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          validator: MultiValidator([
            RequiredValidator(errorText: "Please enter your email address"),
            EmailValidator(errorText: "Please enter a valid email address"),
          ]),
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.email)),
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? email) {
            profile.email = email!;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          validator: RequiredValidator(errorText: "Please input username"),
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
          onSaved: (String? username) {
            profile.username = username!;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          validator: RequiredValidator(errorText: "Please input password"),
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
          obscureText: true,
          onSaved: (String? password) {
            profile.password = password!;
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              formKey.currentState?.reset();
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return LoginScreen();
              })));
            }
          },
          child: Text(
            "Register",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return HomeScreen();
          })));
        },
        child: Text("Forgot password?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
