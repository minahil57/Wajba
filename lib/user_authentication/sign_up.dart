import 'package:flutter/material.dart';
import 'package:wajba_new/QR_code_screen/qr_code.dart';
import 'package:wajba_new/user_authentication/sign_in.dart';
import 'package:mysql1/mysql1.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller =TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  String status = '';
  //INSERT INTO `user_credentials` (`user_id`, `email`, `password`, `name`) VALUES (NULL, '', '', '')
  Sign_up() async {
    try {
      var settings =  ConnectionSettings(
          host: '192.168.0.106',
          port: 3306,
          user: 'minahilakhtar',
          password: 'Minahil@123',
          db: 'check'
      );
      var connect = await MySqlConnection.connect(settings);
      print("hi");
      var result = await connect.query(
          "SELECT * FROM `user_credentials` where email = ?",
          [email_controller.text]);
      print("hello");
      // var results = await conn.query('select name, email from users where id = ?', [userId]);
        if (result.isNotEmpty) {
          status = "User already Exits $result";
          print("I am her");

        } else {
          status = "not login";
          print("haha");
          var result1 = await connect.query("INSERT INTO `user_credentials` (`user_id`, `email`, `password`, `name`) VALUES (NULL, ?, ?, ?)",[null , email_controller.toString(), pass_controller.toString(), name_controller.toString()]);
          print('Inserted row id=${result1.insertId}');
          if (result1.isNotEmpty) {
           print("OMG");
            Navigator.pushReplacement(context,
              MaterialPageRoute(
                builder: (context) => MyApp_qr(),

              ),
            );
          }
          else
            {
              print("Not done");
            }
        }

      print("result $result");
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("lib/assets/images/backgroundimage/1000_F_156533943_i322J91kowv9eG6Q80bT8IJt19sYMSqu.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
        child:Padding(padding: EdgeInsets.only(bottom: 60,top: 70,left: 10,right: 10),
        child:
          Card(
            elevation: 10,
            shadowColor: Colors.black,
           // margin: const EdgeInsets.fromLTRB(10,60,10,57),
            color: Theme.of(context).colorScheme.background,
            shape:  RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10),
              //only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
            ),
            child:Container(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      "lib/assets/images/logo/logo.png",
                      height: 170.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lets Get Started'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'Create an account to Wajba to get all the features',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child:Column(
                        children: [
                          // FittedBox(
                          //   child:Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children:[
                          //         const SizedBox(
                          //             height: 20
                          //         ),
                                  TextFormField(
                                    controller: name_controller,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.person),
                                        // labelText: "Your Email",
                                        hintText: "First Name*",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                          borderSide: BorderSide(
                                            width: 1, color: Theme.of(context).colorScheme.surface,),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 5,
                                    height: 20,
                                  ),
                                  // SizedBox(
                                  //   width:170,
                                  //   //height: 150,
                                  //   child:TextFormField(
                                  //     validator: (text) {
                                  //       if (text == null || text.isEmpty) {
                                  //         return 'Text is empty';
                                  //       }
                                  //       return null;
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       prefixIcon: const Icon(Icons.person),
                                  //       hintText: "Last Name*",
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                  //         borderSide: BorderSide(
                                  //           width: 1,
                                  //           color: Theme.of(context).colorScheme.surface,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //
                                  // ),
                          //       ]
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email_controller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(

                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: pass_controller,
                            validator: (value) {

                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 120.0),
                                  ),
                                  foregroundColor: MaterialStateProperty.all<
                                      Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(Theme
                                      .of(context)
                                      .colorScheme
                                      .primary,),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary,),
                                        borderRadius: BorderRadius.circular(
                                            30.0),
                                      )
                                  )
                              ),
                              onPressed:
                                  () {
                               Sign_up();

                              },
                              child: Text(
                                  "Create".toUpperCase(),
                                  style: const TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        const Text('Already Have Account?'),
                        TextButton(
                          onPressed:
                              //createUserWithEmailAndPassword(),
                              () {
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => login_page(),

                              ),
                            );
                          },

                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed:
                          () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp_qr(),

                          ),
                        );
                      },
                      child: const Text('Skip for Now'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //   ],
                    // ),
                  ]
              ),
            ),
          ),),
        ),],
    );
  }
}