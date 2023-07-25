import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Menu_display_files/menu_screen.dart';
import '../prepration_time_and_review/prepration_time.dart';
import '../models/modals.dart';
import '../models/store_data.dart';
import 'add_to_cart.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  //const Cart({Key? key, required this.title}) : super(key: key);
  //final String title;
  // final menu cart;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  String dropdownvalue = '1';
  String dropdownvalue1 = '1';

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
            children: [
              const SizedBox(
                height: 49,
              ),
              Row(
                children:  [
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(Icons.close,
                      color: Colors.orangeAccent,
                      size: 35,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const wajba(),));
                    },
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text(' Cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,

                    ),
                  ),

                ],
              ),
              const Text('La-Montana Pir-Sohawa',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.all(30),
                elevation: 25,
                shadowColor: Colors.black,
                color: Theme.of(context).colorScheme.onBackground,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: SizedBox(
                  width: 300,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35.0),//,right: 100.0),

                    child: Row(
                        children:  [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.end,

                                  children: const [
                                    Text(
                                      'Estimated Prepration Time',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                  ]),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  const SizedBox(
                                    // height: 20,
                                    width: 16,
                                  ),
                                  RichText(
                                    text:  const TextSpan(
                                      text: 'Now (60 mins)',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],),
                              //SizedBox
                            ],
                          ),

                        ] ),

                  ), //SizedBox
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children:[ DropdownButton(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("lib/assets/images/Menu/page1/makke-ki-roti.jpg"),
                          )
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Saag with \n'
                              'Makai ki Roti',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('With Lassi',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],),
                    ),
                    const Text('Rs 550.00',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child:
                  Divider(
                    thickness: 1,
                  )
              ),
              Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children:[
                    DropdownButton(

                      // Initial Value
                      value: dropdownvalue1,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("lib/assets/images/Menu/page1/makke-ki-roti.jpg"),
                          )
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Saag with \n'
                              'Makai ki Roti',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('With Lassi',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],),
                    ),
                    const Text('Rs 550.00',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child:
                  Divider(
                    thickness: 1,
                  )
              ),
              Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => wajba(),

                            ),
                          );
                        },
                        child: Text('Add more Items'),
                      ),

                    ],
                  )
              ),

              Container(
                height: 200,
                width: double.maxFinite,
                color: Theme.of(context).colorScheme.onBackground,

                child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 10,),
                        child:
                        Text('Popular with your order',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 10,),
                        child:
                        Text('Other customers also baught these',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      Expanded(
                          child:

                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: DataStore.ch.length,
                              itemBuilder: (BuildContext context, int index) {
                                menu chin = DataStore.ch[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) {
                                      return details(detail: chin);
                                    }));
                                  },
                                  child:
                                  SingleChildScrollView(
                                    physics: const ScrollPhysics(),
                                    child:
                                    Column(
                                      children:[
                                        Container(
                                          height: 140,
                                          width: 100,
                                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                            // gradient: LinearGradient(
                                            //   begin: Alignment.topCenter,
                                            //   end: Alignment.bottomCenter,
                                            //   colors: <Color>[
                                            //     Colors.black.withAlpha(0),
                                            //     Colors.orangeAccent,
                                            //     Colors.white
                                            //   ],
                                            // ),
                                          ),
                                          child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: 99.9,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          shape: BoxShape.rectangle,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(chin.image)
                                                          )
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

                                                  ],
                                                ),
                                                Text(
                                                  chin.item,
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  chin.detail1,
                                                  style: const TextStyle(
                                                    fontSize: 5,
                                                    fontWeight: FontWeight.w100,
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ],),),);
                              }
                          )
                      ),
                    ]
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 10,right: 20),
                  child:
                  Row(
                    children: const [
                      Expanded(
                        child:Text('Subtotal',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text('Rs-2600')
                    ],
                  )
              ),
              const SizedBox(height: 20,),
              const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 10,right: 20),
                  child:
                  Row(
                    children: const [
                      Expanded(
                        child:Text('Total',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text('Rs-2600')
                    ],
                  )
              ),
              const SizedBox(height: 30,),
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
                  onPressed:
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Prepration_time()),
                    );
                  },
                  child: Text(
                      "Confirm your order".toUpperCase(),
                      style: const TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )
                  )
              ),
              SizedBox(
                height: 10,
              ),

            ]
        ),
      ),
    );
  }
}