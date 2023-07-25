import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:wajba_new/models/modals.dart';
import '../Menu_display_files/menu_screen.dart';
import 'cart.dart';


class details extends StatefulWidget {


  const details({Key? key, required this.detail}) : super(key: key);
  final menu detail;
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  String? method;
  String? method1;
  String? method2;
  bool half = false;
  bool full = false;
  bool deal1 = false;
  bool deal2 = false;
  bool deal3 = false;
  bool cancel = false;
  bool remove = false;
  bool call = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            // Container(
            //   height: 250,
            //   child:
            //   Padding(padding: const EdgeInsets.only(left: 0,),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(0),
            //       child: Image.asset(widget.detail.image, width: 400, fit: BoxFit.fill),
            //     ),
            //   ),
            // ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.detail.image),
                      )
                  ),
                ),
                Positioned(
                  top:30 , left: 10,
                  child: InkWell(
                    child: Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const wajba(),));
                    },
                  ),

                ),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.only(left:10,right: 20),
              child:
              Row(
                  children:[
                    Expanded(child:
                    Text(widget.detail.item,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ),
                    Text(widget.detail.price,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ]
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(padding: EdgeInsets.only(left: 10),
              child:Text('2 makae ki roti with saag',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              child:Divider(
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //-------------------------------------Card Start-------------------------------------------------------------
            Padding(padding: EdgeInsets.only(left:10,right: 10),
              child:
              // Container(
              //   height: 180,
              //   width: double.infinity,
              //   child:
              //   ClipRRect(
              //     borderRadius: BorderRadius.circular(30),
              //child:
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                elevation: 10,
                child:
                Padding(padding: EdgeInsets.only(left: 15,right: 10,top: 15),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:  [
                          Expanded(child: Text('Variations',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color:  Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:
                            Container(

                              height: 20,
                              width: 60,
                              color:  Theme.of(context).colorScheme.primary,
                              child:
                              const Center(child:
                              Text('Required',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white60,
                                ),
                              ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Select one',
                        style: TextStyle(
                          color:  Theme.of(context).colorScheme.background,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                          children:[
                            Expanded(child:
                            RadioListTile(
                              title: const Text("Half",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              activeColor:  Theme.of(context).colorScheme.background,
                              value: "half",
                              groupValue: method,
                              onChanged: (value){
                                setState(() {
                                  method = value.toString();
                                  half = !half;
                                });
                              },
                            ),
                            ),
                            const Text('300',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ]
                      ),
                      Row(
                        children: [
                          Expanded(child:
                          RadioListTile(
                            title: const Text("Full",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            activeColor:  Theme.of(context).colorScheme.background,
                            value: "full",
                            groupValue: method,
                            onChanged: (value){
                              setState(() {
                                method = value.toString();
                                full = !full;
                              });
                            },
                          ),
                          ),
                          const Text('500',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // ),
                  // ),
                ),
              ),
            ),

            //---------------------------------------Card End---------------------------------------------------------------
            const SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.only(left: 10,right: 10),
              child:
              Row(
                children:  [
                  const Expanded(
                    child:
                    Text('Frequently bought together',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:
                    Container(

                      height: 20,
                      width: 60,
                      color: Colors.grey,
                      child:
                      const Center(child:
                      Text('Optional',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white60,
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 10,),
              child:
              Text('other customers also ordered these',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.orangeAccent,
              secondary: Text('800',),
              title: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('lib/assets/images/Menu/page1/kheer.jpeg',fit: BoxFit.fill,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Deal 1')
                ],
              ),
              value: this.deal1,
              onChanged: (bool? value) {
                setState(() {
                  this.deal1 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.orangeAccent,
              secondary: const Text(
                '500',
              ),
              title: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('lib/assets/images/Menu/page1/la montana.jpg',fit: BoxFit.fill,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Deal 2')
                ],
              ),
              value: this.deal2,
              onChanged: (bool? value) {
                setState(() {
                  this.deal2 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.orangeAccent,
              secondary: Text('800',),
              title: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('lib/assets/images/Menu/page1/makke-ki-roti.jpg',fit: BoxFit.fill,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Deal 3')
                ],
              ),
              value: this.deal3,
              onChanged: (bool? value) {
                setState(() {
                  this.deal3 = value!;
                });
              },
            ),

            const Padding(padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              child:Divider(
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(left: 10,),
              child:
              Text('Special Instructions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),

              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 10,right: 10),
              child:
              Text('Please let us know if you are allergic to anything or if we need to avoid anything',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 400.0,
              margin: const EdgeInsets.only(right: 10, left: 10),
              child:
              TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'e.g. no mayo',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                      ),
                    ),
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20),
              child:
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('0/500',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ]
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(left: 10,),
              child:
              Text('If this product is not available',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
                initiallyExpanded: false,
                title: const Text('If this Product is not avaliable',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 20),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RadioListTile(
                          title: const Text("Remove it from my order",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          activeColor: Colors.orangeAccent,
                          value: "remove",
                          groupValue: method2,
                          onChanged: (value){
                            setState(() {
                              method2 = value.toString();
                              remove = !remove;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text("Cancel entire order",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          activeColor: Colors.orangeAccent,
                          value: "cancel",
                          groupValue: method2,
                          onChanged: (value){
                            setState(() {
                              method2 = value.toString();
                              cancel = !cancel;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text("Call & confirm",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          activeColor: Colors.orangeAccent,
                          value: "call",
                          groupValue: method2,
                          onChanged: (value){
                            setState(() {
                              method2 = value.toString();
                              call = !call;
                            });
                          },
                        ),
                      ],
                    ),

                  )
                ]
            ),

            Padding(padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,),
              child:
              Row(
                  children:[
                    Expanded(child:
                    Container(
                      width: 100,
                      child:
                      NumberInputPrefabbed.roundedButtons(
                        controller: TextEditingController(),
                        textAlign: TextAlign.center,
                        incIcon: Icons.plus_one,
                        decIcon: Icons.exposure_minus_1,
                        incIconColor: Colors.white,
                        decIconColor: Colors.white,
                        incIconSize: 20,
                        decIconSize: 20,
                        numberFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        incDecBgColor: Colors.orangeAccent,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                      ),
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 76.0),
                            ),
                            foregroundColor: MaterialStateProperty.all<
                                Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<
                                Color>(Colors.orangeAccent,),
                            // (Theme
                            // .of(context)
                            // .colorScheme
                            // .surface,),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  side: const BorderSide(color:Colors.orangeAccent,),
                                  //Theme.of(context).colorScheme.surface,),
                                  borderRadius: BorderRadius.circular(
                                      30.0),
                                )
                            )
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) =>  Cart(cart: widget.detail)),
                            MaterialPageRoute(builder: (context) =>  Cart()),
                          );
                        },
                        child: Text(
                            "Add to cart".toUpperCase(),
                            style: const TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )
                        )
                    ),

                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}