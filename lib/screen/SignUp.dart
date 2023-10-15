
import 'package:aleef/screen/SignIn.dart';
import 'package:flutter/material.dart';

import '../constant/ButtonItem.dart';
import '../constant/DefultButton.dart';
import '../constant/MyInkWell.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/TextForm.dart';
import 'Home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String? email;
  String? password;
  String? conpassword;
  String? errorText='';

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getheightScreen(20),),
                Text('Sign Up',style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff85dd0b)
                ),
                ),
                SizedBox(height: getheightScreen(60),),
                TextForm(
                  obscureText: false,
                  icon: Icons.email,
                  mykey: TextInputType.emailAddress,
                  lableText: 'Email',
                  validation: (value){},
                  press: (value){
                    email=value;
                  },

                ),
                SizedBox(height: getheightScreen(40),),
                TextForm(obscureText: true,
                  icon: Icons.visibility_off,
                  lableText: 'Password',
                  mykey: TextInputType.text,
                  validation: (value){},
                  press: (value){
                    password=value;
                  },
                ),
                SizedBox(height: getheightScreen(40),),
                TextForm(obscureText: true,
                  icon: Icons.visibility_off,
                  lableText: 'confirm Password',
                  mykey: TextInputType.text,
                  validation: (value){},
                  press: (value){
                    conpassword=value;
                  },
                ),
                SizedBox(height: getheightScreen(25),),
                Text(errorText!,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(1,3),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: getheightScreen(25),),

                DefultButton('Sign up', () {
                  setState(() {
                    if(email==null||password==null){
                      errorText='Some One Field is Empty';
                    }
                    else if (password!=conpassword){
                      errorText='please confirm from password ';

                    }
                    else if (password==conpassword){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Scaffold(

                          backgroundColor: Color(0xffffffff),




                          body:Container(
                            child: Column(
                              children: [
                                SizedBox(height: 300,),
                                Text('    Signup Sucsessfully :)',style: TextStyle(color: Color(0xff85dd0b),fontSize: 40,)
                                ),
                                SizedBox(height: 70,),

                              ],
                            )

                              ),


                        );
                      }));
                    }

                    else{
                      print(errorText);
                      errorText='The Email or Password is wrong';
                    }
                  });
                }),
                SizedBox(height: getheightScreen(30),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("if you have an Account ? ",
                      style: TextStyle(
                        color: Color(0xff85dd0b),
                        fontSize: 18,
                      ),
                    ),
                    myInkWell('Cleck Here', (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return SignIn();
                          }));

                    }),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
