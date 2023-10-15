
import 'package:aleef/screen/SignUp.dart';
import 'package:flutter/material.dart';

import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/ButtonItem.dart';
import '../constant/DefultButton.dart';
import '../constant/MyInkWell.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/TextForm.dart';
import 'Home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String? email;
  String? password;
  String? errorText='';

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xffffffff),

    bottomNavigationBar: BottomBar(
        BottomNu: 2,
        callBack:(index){
      BottomBarSwich(index, context);
    } ,),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getheightScreen(20),),
                Text('Sign In',style: TextStyle(
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
                SizedBox(height: getheightScreen(25),),
                Text(errorText!,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(1,3),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: getheightScreen(25),),

                DefultButton('Sign In', () {
                  setState(() {
                    if(email==null||password==null){
                      errorText='Some One Field is Empty';
                    }
                    else if (email=='afnan222022@gmail.com' && password=='2212'){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Home();
                      }));
                    }

                    else{
                      print(errorText);
                      errorText='The Email or Password is wrong';
                    }
                  });
                }),
                SizedBox(height: getheightScreen(30),),
                const Text('OR',style: TextStyle(fontSize: 30,color: Color(0xff85dd0b)),),
                SizedBox(height: getheightScreen(30),),
                ButtoItem('assets/svgImages/facebook-svgrepo-com.svg','Continue with FaceBook',(){},context),
                SizedBox(height: getheightScreen(30),),
                ButtoItem('assets/svgImages/google-svgrepo-com.svg','Continue with Google',(){},context),
                SizedBox(height: getheightScreen(30),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("if you don\'t have an Account ? ",
                      style: TextStyle(
                        color: Color(0xff85dd0b),
                        fontSize: 18,
                      ),
                    ),
                    myInkWell('Sign Up', (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return SignUp();
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
