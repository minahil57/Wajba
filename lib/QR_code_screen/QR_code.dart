import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:wajba_new/Menu_display_files/menu_screen.dart';
import 'package:wajba_new/main_splash_drawer/drawwer/profile.dart';
import 'package:wajba_new/user_authentication/sign_in.dart';



class MyApp_qr extends StatefulWidget {
  @override
  _MyApp_qrState createState() => _MyApp_qrState();
}

class _MyApp_qrState extends State<MyApp_qr> {
  Uint8List bytes = Uint8List(0);
  late TextEditingController _outputController;
  @override
  initState() {
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Wajba'),
            backgroundColor: const Color(0xfffa9b28),
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,

            child:
            ListView(

              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30,),
                        child:
                        Column(
                            children: const [
                              CircleAvatar(
                                minRadius: 50,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage("lib/assets/images/logo/girl.jpeg",
                                ),
                              ),

                            ]
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                            Text('Minahil Akhtar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                          ]
                      ),

                    ]
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(padding: EdgeInsets.only(left: 40),
                  child:
                  Text('Learn more',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),


                const Divider(
                  thickness: 1,
                ),

                const ListTile(

                  leading: Icon(Icons.article,color: Colors.orangeAccent,),
                  title: Text("My Orders",style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                ),

                 ListTile(
                  leading: Icon(Icons.account_circle,color: Colors.orangeAccent,),
                  title: Text("My Profile",style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                  onTap:
                      () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => profile(),

                          ),
                        );
                      }
                ),

                const ListTile(
                  leading: Icon(Icons.announcement_rounded,color: Colors.orangeAccent,),
                  title: Text("Vouchers",style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                ),

                const ListTile(
                  leading: Icon(Icons.help_center,color: Colors.orangeAccent,),
                  title: Text("Help Center",style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                ),
                const ListTile(
                  leading: Icon(Icons.account_balance_outlined,color: Colors.orangeAccent,),
                  title: Text("About us",style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                ),

                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: const Icon(Icons.logout,color: Colors.orangeAccent,),
                  title: const Text("Log Out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Colors.black,
                    ),),
                  onTap: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => login_page(),

                      ),
                    );

                  },
                ),
              ],
            ),
          ),
          body:Builder(
            builder: (BuildContext context) {
              return ListView(
                children: <Widget>[
                  _qrCodeWidget(this.bytes, context),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                       // _userUid(),
                        const SizedBox(height: 20),
                        // TextField(
                        //   controller: this._outputController,
                        //   maxLines: 2,
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.wrap_text),
                        //     helperText:
                        //     'The barcode or qrcode you scan will be displayed in this area.',
                        //     hintText:
                        //     'The barcode or qrcode you scan will be displayed in this area.',
                        //     hintStyle:  TextStyle(fontSize: 15),
                        //     contentPadding:
                        //     EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        this._buttonGroup(),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orangeAccent,
            //shape:ShapeBorder,
            child: Icon(Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                // MaterialPageRoute(builder: (context) =>  Cart(cart: widget.detail)),
                MaterialPageRoute(builder: (context) =>  wajba()),
              );
            },
          ),
        ),
    );
  }

  Widget _qrCodeWidget(Uint8List bytes, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 6,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 90),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'lib/assets/images/logo/logo.png',
                              width: 175, height: 170, fit: BoxFit.fill),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            'Welcome To Wajba!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Please Scan the QR code Placed on the Table',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],)
                  ),

                ],
              ),
            ),
          ],

        ),

      ),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 150,
            child: InkWell(
              onTap:
              _scan,
              child: Card(
                child: Column(
                  children: const <Widget>[
                    Expanded(
                      flex: 2,
                      child: Icon(Icons.add_a_photo, color: Colors.orangeAccent,
                        size: 50,),
                    ),
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("Scan")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const wajba()),
      );
    }
  }

}
