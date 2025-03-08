
import 'package:flutter/material.dart';
import 'package:futter_final_exam/service/auth_service.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              'Sign up',
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
                    final res = await AuthService.authService.createAccountWithEmailPass(txtEmail.text, txtPassword.text);
                    txtEmail.clear();
                    txtPassword.clear();

                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('SignUp'),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.app_registration),
                  ],
                )),
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
