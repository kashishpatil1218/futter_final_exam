import 'package:flutter/material.dart';
import 'package:futter_final_exam/screen/auth/signUp.dart';
import 'package:futter_final_exam/service/auth_service.dart';

import '../home_page.dart';


class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {

    var txtEmail = TextEditingController();
    var txtPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Log In',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          buildTextField(txtEmail, 'Email', Icons.email),
          buildTextField(txtPassword, 'Password', Icons.password),




          const SizedBox(height: 12,),

          Center(
            child: ElevatedButton(
                onPressed: () async {
                  if(txtEmail.text.isNotEmpty && txtPassword.text.isNotEmpty ){
                    final result = await AuthService.authService.signInWithEmailPasswors(
                        txtEmail.text, txtPassword.text);
                    if(result != null){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TodoHomePage(),));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login success..'), duration: Duration(seconds: 2),));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed!!!'), duration: Duration(seconds: 2),));

                    }
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Login'),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.login),
                  ],
                )),
          ),


          const SizedBox(height: 24,),

          Center(
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));
            }, child: const Text('Don\'t have account ? Sign up'),),
          ),

        ],
      ),
    );
  }
}

Widget buildTextField(
    TextEditingController controller, String hintText, IconData icon) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade200),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
