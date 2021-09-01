import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            children: [
              Center(
                child: Text(
                  'Register'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              //
              const SizedBox(height: 20.0),
              //
              CupertinoFormSection.insetGrouped(
                header: const Text('Account'),
                footer: const Divider(),
                margin: const EdgeInsets.all(12.0),
                children: [
                  // email
                  CupertinoFormRow(
                    prefix: const Text('Email'),
                    child: CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      placeholder: 'Enter Email',
                    ),
                  ),
                  // password
                  CupertinoFormRow(
                    prefix: const Text('Password'),
                    child: CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      validator: (password) {
                        if (password == null || password.isEmpty)
                          return 'Enter a valid password';
                        else if (password.length < 6)
                          return 'Password must be atleast 6 character length';
                        else
                          return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      placeholder: 'Enter Password',
                    ),
                  )
                ],
              ),

              //

              CupertinoFormSection.insetGrouped(
                header: const Text('User Details'),
                footer: const Divider(),
                margin: const EdgeInsets.all(12.0),
                children: [
                  CupertinoFormRow(
                    prefix: const Text('Name'),
                    child: CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      placeholder: 'Enter Name',
                    ),
                  ),
                  //
                  CupertinoFormRow(
                    prefix: const Text('Username'),
                    helper: const Text(
                      'You cannot change the username once registered',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey2, fontSize: 12.0),
                    ),
                    child: CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      placeholder: 'Enter Username',
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20.0),
              CupertinoButton.filled(
                  child: const Text('Submit'),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      Fluttertoast.showToast(
                          msg: 'Sucessful',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.green,
                          fontSize: 16.0);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
