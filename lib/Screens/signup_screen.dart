import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/signup_provider.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Welcome To SignUp Page "),),
      body: Consumer<SignUpProvider>(builder: (context, value, child)
      {
        return  Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "UserName",
                      border: OutlineInputBorder(borderRadius:  BorderRadius.circular(20))
                  ),
                  controller: userName,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(borderRadius:  BorderRadius.circular(20))
                  ),
                  controller: email,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderRadius:  BorderRadius.circular(20))
                  ),
                  controller: password,
                ),
                SizedBox(height: 40,),
                OutlinedButton(
                    onPressed: () async{
                      bool signup = await Provider.of<SignUpProvider>(context,listen: false).signup(userName.text, email.text, password.text);
                      if(signup)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                    },
                    child: Text("SignUp"),
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
