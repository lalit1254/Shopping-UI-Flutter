import 'package:flutter/material.dart';
import 'package:learningproject/utlis/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();
  //this is used to give a key to widget wraped with form.

  moveToHome(BuildContext context) async {
    //so when we press onTAp we come to moveToHome , so we use validation as
     if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      //setstate is used to show the new changed state after
      await Future.delayed(Duration(milliseconds: 500));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,

            //after doing this the texform field is automatically associated with the form
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login1.png",
                  fit: BoxFit.fitWidth,
                  scale: 2
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 65.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                           else if ( value.length < 6) {
                            return "password length should be at least 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 60.0,
                      ),

                      Material(
                        color: Colors.deepPurple,
                       borderRadius:
                           BorderRadius.circular(changeButton ? 25 : 9),
                        child: InkWell(
                          // hoverColor: Colors.green,
                          splashColor: Colors.green,

                          // onTap: () async {
                          //   setState(() {
                          //     changeButton = true;
                          //   });
                          //   await Future.delayed(Duration(seconds: 1));

                          //   await Navigator.pushNamed(
                          //       context, MyRoutes.homeRoute);
                          //   setState(() {
                          //     changeButton = false;
                          //   });
                          // },

                          //previously it was like this, but we can write it as below:

                          onTap: () => moveToHome(context),

                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changeButton ? 80 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            // color: Colors.deepPurple,

                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(minimumSize: Size(90, 50)),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
