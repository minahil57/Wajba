import 'package:flutter/material.dart';

import '../../QR_code_screen/QR_code.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
                children: [
                    Container(
                    color: const Color(0xfa9b28),
                    height: 50,
                    width: double.infinity,
                    child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Padding(padding: EdgeInsets.only(left: 10,top: 20),
                    child:
                    InkWell(
                    onTap: () {
                      {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp_qr(),

                          ),
                        );
                      }
                    },
                    child:
                    const Icon(Icons.arrow_back_ios,
                    color: Colors.orangeAccent,
                    ),
                    ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 120,top: 20),
                    child:
                    Text('User Profile',
                    style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    ),
                    ),
                    ),
                    ],
                    ),
                    ),
            const SizedBox(
              height: 50,
            ),
                 Stack(
                 children:[
                   Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/logo/girl.jpeg'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0, right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.orangeAccent,)
                        ),
                        child: const Icon(Icons.add,
                          color: Colors.white,
                        ),
                        //color: Colors.white,
                      )

                  ),
            ]
                 ),
            // const SizedBox(
            //   height: 20,
            // ),
        const Padding(padding: EdgeInsets.only(top: 20,),
          child:
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Minahil Akhtar'),
              trailing:Icon(Icons.edit),
            ),
        ),
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 2,
                )
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('mano8@gmail.com'),
              trailing:Icon(Icons.edit),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 2,
                )
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(Icons.location_city_outlined),
              title: Text('Islamabad'),
              trailing:Icon(Icons.edit),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 2,
                )
            ),

          ],
        )
    );
  }
}