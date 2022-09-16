import 'package:chat_app/Authenticate/CreateAccount.dart';
import 'package:chat_app/Authenticate/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => const SignupPage(),
        '/forgotpassword': (BuildContext context) => const ForgotPassword(),
        '/loginScree': (BuildContext context) => const LoginScreen(),
        '/MhomeScreen': (BuildContext context) => const MyHomePage(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _success = 1;
  String _userEmail = "";
  final _isLoading = false;
  var errorMessage;

  void _singIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = 2;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                      height: 130,
                  padding: const EdgeInsets.fromLTRB(110.0, 35.0, 0.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/food.png",
                        ),
                        radius: 60,
                      ),
                    ),
              

                Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 165.0, 0.0, 0.0),
                  child: const Text('Food Recipe',
                      style: TextStyle(
                        color: Color.fromARGB(255, 233, 207, 11),
                          fontSize: 40.0, fontWeight: FontWeight.bold)),
                ),
                ],
            ),
            Form(
              key: _key,
              child: Container(
                padding:
                    const EdgeInsets.only(top: 85.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            // this button is used to toggle the password visibility
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                  validator:
                                  (value) {
                                    if (value!.isEmpty) {
                                      return "Password cannot not be empty.";
                                    }
                                    return null;
                                  };
                                }))),
                    const SizedBox(height: 5.0),
                    Container(
                      alignment: const Alignment(1.0, 0.0),
                      padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgotpassword');
                        },
                        child: const Text(
                          'Forgot password ?',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          _success == 1
                              ? ''
                              : (_success == 2
                                  ? 'Successfully signed in ' + _userEmail
                                  : 'Sign in failed'),
                          style: const TextStyle(color: Colors.red),
                        )),
                    const SizedBox(height: 40.0),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              try {
                                final User? user =
                                    (await _auth.signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text))
                                        .user;
                                print(user);
                                if (user != null) {
                                  setState(() {
                                    _success = 2;
                                    _userEmail = user.email!;
                                  });
                                  Navigator.of(context)
                                      .pushReplacementNamed('/MhomeScreen');
                                }
                              } on Exception catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height -
                                              100,
                                      right: 20,
                                      left: 20),
                                ));
                                print(e.toString());
                              }
                            } else {
                              setState(() {
                                _success = 3;
                              });
                            }
                          },
                          child: const Text('Login'),
                        )),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'New to Food Recipe ?',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        const SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}