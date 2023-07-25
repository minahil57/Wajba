import 'package:flutter/material.dart';
import '../Menu_display_files/menu_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';



class Prepration_time extends StatefulWidget {
  const Prepration_time({Key? key}) : super(key: key);

  @override
  State<Prepration_time> createState() => _Prepration_timeState();
}

class _Prepration_timeState extends State<Prepration_time> {
  // final CountdownController _controller = new CountdownController(autoStart: true);
  TextEditingController review_controller = TextEditingController();
  String text_review = '';
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
      ),
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
      ),
      child: Text("Submit"),
      onPressed:  () {
        // Navigator.pop(context);
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content:
            Container(
              width: 300, // Set the desired width
              height:200,
              child:Column(
              children: [
                Center(
                  child:  Image.asset(
              'lib/assets/images/backgroundimage/tick.gif',
                width: 120, // Set the desired width
                height: 120, // Set the desired height
                fit: BoxFit.contain, // Adjust the fit as needed
                colorBlendMode: BlendMode.luminosity,
              ),
                ),
            RichText(
              textAlign :TextAlign.center,
              text: TextSpan(
                text: 'We Value Your Review\n \n',
                style:  TextStyle(
                fontWeight: FontWeight.bold,
               fontSize: 15,
                  color: Colors.orangeAccent,
              ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Thankyou! for your Review',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
              ],
            ),
            ),
            actions: <Widget>[
          TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
        ),
        child: Text("Okay"),
        onPressed:  () {
        Navigator.pop(context);
        },
        ),
            ],
          ),
        );


      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
     // title:
      content:
      Container(
        width: 300, // Set the desired width
        height: 370,
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'lib/assets/images/logo/food-like-dislike-icon-critic-260nw-2052024782-removebg-preview.png',
              width: 120, // Set the desired width
              height: 120, // Set the desired height
              fit: BoxFit.contain, // Adjust the fit as needed
              colorBlendMode: BlendMode.luminosity,
            ),
          ),
          Text("Rate Your Food\nHow Was Your Food?\n"),
          Padding(
       padding: const EdgeInsets.only(top: 5,bottom: 5 ,),
         child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[

              Icon(
                Icons.cleaning_services_outlined,
                color: Colors.orangeAccent,
              ),

              Expanded(
                  child:
                Text("Service"),
              ),
              _Rating(),
            ]
          ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5 ,),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Icon(
                  Icons.room_service_outlined,
                  color: Colors.orangeAccent,
                ),
                Expanded(
                  child:
                  Text("Food"),
                ),
                _Rating(),
              ]
          ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5 ,),
         child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Icon(
                  Icons.roofing_outlined,
                  color: Colors.orangeAccent,
                ),
                Expanded(
                  child:
                  Text("Ambiance"),
                ),
                _Rating(),
              ]
          ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 5 ,),
         child: _Text(),
      ),
        ],
      ) ,
      ),
      actions: [
        cancelButton,
        continueButton,
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
  Widget _Text(){
    return TextField(
      cursorColor: Colors.orangeAccent,
      controller: review_controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white30,
        hintText: 'Any Suggestions??',
        border: OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.orangeAccent,
        ),

        ),
        // labelText: 'Full Name',
      ),
      onChanged: (text) {
        setState(() {
          text_review = text;
          //you can access  in its scope to get
          // the value of text entered as shown below
        });
      },
    );
  }
  Widget _Rating(){
    return  RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      // itemPadding: EdgeInsets.symmetric(
      //  horizontal: 4.0),
      itemBuilder: (context, _) =>
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: const Icon(Icons.close,
                    color: Colors.orangeAccent,
                    size: 35,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const wajba(),));
                  },
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text('Your Order',
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
            Column(
              children: [
                Image.asset(
                  "lib/assets/images/backgroundimage/6a0ead42d3907b1310e67c33cb638211.gif",
                  height: 150.0,
                  width: 150.0,
                  colorBlendMode: BlendMode.luminosity,
                ),
                const Text('Estimated Prepration time ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,

                  ),
                ),
                TimerCountdown(
                  format: CountDownTimerFormat.hoursMinutesSeconds,
                  timeTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  endTime: DateTime.now().add(
                    Duration(
                      // days: 5,
                       hours: 0,
                       minutes: 0,
                      seconds: 4,
                    ),
                  ),
                  onEnd: () {
                    print("Timer finished");
                    showAlertDialog(context);
                  },
                ),
              ],
            ),
            ExpansionTile(
                initiallyExpanded: true,
                iconColor: Colors.orangeAccent,
                title: const Text('Order Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Padding(padding: const EdgeInsets.only(left: 20),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Order No. ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Order From ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Delivery Table ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Total ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                          ],
                        ),

                      ),
                      Padding(padding: const EdgeInsets.only(right: 20),
                        child:
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end
                          ,
                          children: const [
                            Text('#ck37-d1yy ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('La Montana Pir Sohawa ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.orangeAccent,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('F1-12 ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rs-2700 ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                          ],
                        ),

                      ),
                    ],),
                ]
            ),
            ExpansionTile(
                initiallyExpanded: true,
                iconColor: Colors.orangeAccent,
                title: const Text('View Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Padding(padding: const EdgeInsets.only(left: 20),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [

                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: '1x ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black )),
                                TextSpan(
                                    text: '  Saag with Makai ki Roti ',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic, color: Colors.black)),
                              ]),),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                text: '1x ',
                                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '  Biryani',
                                    style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,fontSize: 13, color:  Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('items ',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Subtotal ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Serice Charges ',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Platform ',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Total (incl. GST) ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),


                          ],
                        ),

                      ),
                      Padding(padding: const EdgeInsets.only(right: 20),
                        child:
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end
                          ,
                          children: const [
                            Text('Rs 399.00',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rs 1999.00',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                //color: Colors.orangeAccent,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('2.00 ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rs 2700 ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rs 202.00 ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rs 4.99 ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Rs 2804.99 ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),



                          ],
                        ),

                      ),
                    ],),
                ]
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
      onPressed: ()
        {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => wajba(),

            ),
          );


    },
          label: Text('Add More',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

    icon: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.orangeAccent,
      ),

    );

  }
}