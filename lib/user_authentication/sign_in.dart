import 'package:flutter/material.dart';
import 'package:wajba_new/user_authentication/sign_up.dart';
import '../QR_code_screen/QR_code.dart';
import 'package:mysql1/mysql1.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String? errorMessage = "";
  String status = '';
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();

  login() async {
    try {
      var settings =  ConnectionSettings(
          host: '192.168.130.47',
          port: 3306,
          user: 'minahilakhtar',
          password: 'Minahil@123',
          db: 'check'
      );
      var connect = await MySqlConnection.connect(settings);
      var result = await connect.query(
          "SELECT * FROM `user_credentials` where email = ? AND password = ? ",
          [email_controller.text, pass_controller.text]);
      // var results = await conn.query('select name, email from users where id = ?', [userId]);
      setState(() {
        if (result.isNotEmpty) {
          status = "login $result";
          Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => MyApp_qr(),

            ),
          );
        } else {
          status = "not login";
          print("$status");
        }
      });
      print("result $result");
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[

          Image.asset(
            "lib/assets/images/backgroundimage/1000_F_156533943_i322J91kowv9eG6Q80bT8IJt19sYMSqu.jpeg",
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(padding: EdgeInsets.only(
                bottom: 100, top: 100, left: 10, right: 10),
              child:
              Card(
                elevation: 10,
                shadowColor: Colors.black,
                color: Theme
                    .of(context)
                    .colorScheme
                    .background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Log in to your existance account on Wajba',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email_controller,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Your Email';
                                }
                                return null;
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                    width: 1, color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface,),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: pass_controller,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter your Password';
                                }
                                return null;
                              },
                              maxLines: 1,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Enter your password',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                    width: 1, color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface,),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CheckboxListTile(
                              title: const Text("Remember me"),
                              contentPadding: EdgeInsets.zero,
                              value: rememberValue,
                              activeColor: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              onChanged: (newValue) {
                                setState(() {
                                  rememberValue = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            const SizedBox(
                              height: 20,
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
                                onPressed: () {
                                  login();
                                },
                                child: Text(
                                    "Log in".toUpperCase(),
                                    style: const TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )
                                )
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Not Registered Yet?'),
                                TextButton(
                                  onPressed:
                                      () {
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (
                                          context) => const RegisterPage(),

                                      ),
                                    );
                                  },
                                  child: const Text('Create an account'),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed:
                                  () {
                                Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp_qr(),

                                  ),
                                );
                              },
                              child: const Text('Skip for Now'),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }

}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("Try Again"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Wrong Credentials"),
    content: Text("Email or Password is wrong!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}