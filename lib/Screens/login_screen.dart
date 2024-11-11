import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/login_provider.dart';
import 'homepage_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Welcome To Login Page "),),
      body: Consumer<LoginProvider>(builder: (context, value, child)
      {
        return  Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                    bool signup = await Provider.of<LoginProvider>(context,listen: false).login( email.text, password.text);
                    if(signup)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomepageScreen()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
