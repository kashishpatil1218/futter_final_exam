// import 'package:flutter/material.dart';
// import 'package:futter_final_exam/screen/auth/signIn.dart';
// import 'package:get/get.dart';
//
// import '../../controller/auth_controller.dart';
// import '../../service/auth_service.dart';
//
//
// class SignUp extends StatelessWidget {
//   const SignUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 120,
//                 horizontal: 50,
//               ),
//               child: Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               height: 577,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 40,
//                 ),
//                 child: Column(
//                   children: [
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           controller: controller.txtEmail,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             hintText: 'Email',
//                             hintStyle: TextStyle(color: Colors.grey.shade800),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           controller: controller.txtPass,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.remove_red_eye),
//                             hintText: 'PassWord',
//                             hintStyle: TextStyle(color: Colors.grey.shade800),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text("Forget Password"),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn(),));
//                       },
//                       child: Text("Already have an account? SignIn"),
//                     ),
//                     SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         AuthService.authService.createAccountWithEmailPass(
//                           controller.txtEmail.text,
//                           controller.txtPass.text,
//                         );
//                       },
//                       child: Container(
//                         height: 60,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
