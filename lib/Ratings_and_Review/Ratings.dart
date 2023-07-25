import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wajba_new/models/model_review.dart';
import '../Menu_display_files/menu_screen.dart';
import '../models/storage.dart';

class review extends StatefulWidget {
  const review({Key? key}) : super(key: key);
  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  TextEditingController review_controller = TextEditingController();
  String text_review = '';
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
             child:Padding(
                  padding: EdgeInsets.only(left:10,top: 40),
                child:Column(
                   children:[
                     Row(
                     children:[
                       InkWell(
                  child: Icon(Icons.close,
                    color: Colors.orangeAccent,
                    size: 35,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) => const wajba(),));
                  },
                ),
                SizedBox(
                  height: 25,
                ),
        Padding(
          padding: EdgeInsets.only(left:10.0,top:10.0,bottom: 10),
          child:Text('Ratings & Reviews',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,

                  ),
                ),
        ),
                       SizedBox(
                         height: 25,
                       ),
        ],),
        ListView.builder(
        padding: const EdgeInsets.only(left: 10,right: 10),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: DataStore.Ree.length,
            itemBuilder: (BuildContext context, int index) {
              review1 Ree = DataStore.Ree[index];
      return Container(
        child: Card(
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Padding(
                padding: EdgeInsets.only(left:10.0,top:10.0,bottom: 10),
                  child:  Text(Ree.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:10.0,top:10.0,bottom: 10,right: 10),
                  child:RatingBarIndicator(
                    rating: Ree.rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                     // size: 5,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  ),
                ),
        ],
              ),
        Padding(
          padding: EdgeInsets.only(left:10.0,top:10.0,bottom: 10,right: 10),
          child:  Text(Ree.review,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,

            ),
          ),
        ),

                ],
              ),
          ),
        );
    }
        ),
        ],
      ),
             ),
      ),
        floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                Wrap(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20,),
                              child: Text('Rate Your Food'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 150, right: 150),
                              child:
                              Divider(
                                thickness: 2,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('What is You Rate',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) =>
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ]
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),

                              child:
                              Divider(
                                thickness: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Please Share Your Opinion',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 150, right: 150),
                              child:
                              Divider(
                                thickness: 2,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Container(
                                margin: EdgeInsets.all(10),
                                height: 400,

                                child: TextField(
                                  cursorColor: Colors.orangeAccent,
                                  controller: review_controller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 50.0),
                                    hintText: 'Your Reivew',
                                    // focusColor: Colors.orangeAccent,
                                    // hoverColor: Colors.orangeAccent,
                                    // fillColor: Colors.orangeAccent,
                                    border: OutlineInputBorder(

                                    ),
                                    // labelText: 'Full Name',
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      text_review = text;
                                      //you can access  in its scope to get
                                      // the value of text entered as shown below
                                      //fullName = review_controller.text;
                                    });
                                  },
                                )),
                            // ElevatedButton(
                            //     style: ButtonStyle(
                            //         padding: MaterialStateProperty.all(
                            //           const EdgeInsets.symmetric(
                            //               vertical: 15.0, horizontal: 120.0),
                            //         ),
                            //         foregroundColor: MaterialStateProperty.all<
                            //             Color>(Colors.white),
                            //         backgroundColor: MaterialStateProperty.all<
                            //             Color>(Theme
                            //             .of(context)
                            //             .colorScheme
                            //             .primary,),
                            //         shape: MaterialStateProperty.all<
                            //             RoundedRectangleBorder>(
                            //             RoundedRectangleBorder(
                            //               side: BorderSide(color: Theme
                            //                   .of(context)
                            //                   .colorScheme
                            //                   .primary,),
                            //               borderRadius: BorderRadius.circular(
                            //                   30.0),
                            //             )
                            //         )
                            //     ),
                            //     onPressed:
                            //         () {
                            //       Navigator.pop(context);
                            //     },
                            //     child: Text(
                            //         "Log in".toUpperCase(),
                            //         style: const TextStyle(fontSize: 14,
                            //           fontWeight: FontWeight.w400,
                            //         )
                            //     )
                            // ),

                          ],
                        )
                    ),
                  ],
                ),
          );
        },
        icon: Icon(Icons.rate_review_outlined),
        label: Text('Write a Review'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orangeAccent,
      ));
    }
  }