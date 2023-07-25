import 'package:flutter/material.dart';
import 'package:wajba_new/Ratings_and_Review/Ratings.dart';
import '../cart/add_to_cart.dart';
//import '../cart/cart.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/modals.dart';
import '../models/store_data.dart';
class wajba extends StatefulWidget {
  const wajba({Key? key}) : super(key: key);

  @override
  State<wajba> createState() => _wajbaState();
}

class _wajbaState extends State<wajba> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {

    // Specifies number of Tabs here
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 7, vsync: this);
    return  Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              child:
              Padding(padding: const EdgeInsets.only(left: 0,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset('lib/assets/images/Menu/page1/la montana.jpg', width: double.infinity, fit: BoxFit.fill),
                ),
              ),
            ),
            Card(
              elevation: 10,
            shadowColor: Colors.black,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            Container(
              child:
              const Padding(padding: EdgeInsets.only(left:20,top: 15),
                  child: Text('La Montana -(Pir Sohawa)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Container(
              child:
              Padding(padding: const EdgeInsets.only(left: 20, top: 5),
                child:Row(
                  children: [
                    RatingBar.builder(
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
                    ),
                    Expanded(
                      flex: 2,
                      child:

                      Padding(padding: EdgeInsets.only(left: 10,right: 20),
                          child:Text('(2000 + rating)',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey,
                            ),
                          )
                      ),
                    ),
                    Expanded(
                      child:TextButton(
                        onPressed:
                            () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>const review(),

                            ),
                          );
                        },
                        child: const Text(
                          'Review & Info',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.orangeAccent,
                tabs: const [
                  Tab(

                    child: Text('Popular',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Discounts & Deals',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Pakistani Food',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Starter',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Salad',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Baverages',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text('Chinese',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ]
            )
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    //scrollDirection: Axis.vertical,
                    //physics:  NeverScrollableScrollPhysics(),

                      shrinkWrap: true,
                      //scrollDirection: Axis.vertical,
                      itemCount: DataStore.popu.length,
                      itemBuilder: (BuildContext context, int index) {
                        menu popuu = DataStore.popu[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return details(detail: popuu);
                            }));
                          },
                          child:
                          SingleChildScrollView(
                            physics:  ScrollPhysics(),
                            child:
                            Column(
                                children:[
                                  ListTile(
                                    tileColor : Colors.white10.withOpacity(0.1),
                                    title:  Text(popuu.item,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    subtitle:
                                    Padding(padding: const EdgeInsets.only(left: 0),
                                      child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(popuu.detail1,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          Text(popuu.detail2,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(popuu.price,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(popuu.image)
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
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child:
                                      Divider(
                                        thickness: 1,
                                        color: Colors.orangeAccent,
                                      )
                                  ),
                                ]
                            ),
                          ),
                        );
                      }
                  ),

                  //----------------------------Discount & Deals Tab--------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
                          itemCount: DataStore.disc.length,
                          itemBuilder: (BuildContext context, int index) {
                            menu disck = DataStore.disc[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return details(detail: disck);
                                }));
                              },
                              child:
                              SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child:
                                Column(
                                    children:[
                                      ListTile(
                                        title:  Text(disck.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(disck.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(disck.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(disck.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(disck.image)
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  //---------------------------------Satarters tab------------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
                          itemCount: DataStore.st.length,
                          itemBuilder: (BuildContext context, int index) {
                            menu star = DataStore.st[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return details(detail: star);
                                }));
                              },
                              child:
                              SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child:
                                Column(
                                    children:[
                                      ListTile(
                                        title:  Text(star.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(star.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(star.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(star.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(star.image)
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  //-------------------------------pakistani food tab--------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
                          itemCount: DataStore.pk.length,
                          itemBuilder: (BuildContext context, int index) {
                            menu pak = DataStore.pk[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return details(detail: pak);
                                }));
                              },
                              child:
                              SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child:
                                Column(
                                    children:[
                                      ListTile(
                                        title:  Text(pak.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(pak.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(pak.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(pak.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(pak.image)
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  //------------------------------salads tab------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
                          itemCount: DataStore.sl.length,
                          itemBuilder: (BuildContext context, int index) {
                            menu sal = DataStore.sl[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return details(detail: sal);
                                }));
                              },
                              child:
                              SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child:
                                Column(
                                    children:[
                                      ListTile(
                                        title:  Text(sal.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(sal.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(sal.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(sal.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(sal.image)
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  //------------------------------baverages tab---------------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
                          itemCount: DataStore.bv.length,
                          itemBuilder: (BuildContext context, int index) {
                            menu bav = DataStore.bv[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return details(detail: bav);
                                }));
                              },
                              child:
                              SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child:
                                Column(
                                    children:[
                                      ListTile(
                                        title:  Text(bav.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(bav.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(bav.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(bav.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(bav.image)
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  //------------------------------chinese tab-----------------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child:
                      ListView.builder(
                        //scrollDirection: Axis.vertical,
                        //physics:  NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,
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
                                      ListTile(
                                        title:  Text(chin.item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle:
                                        Padding(padding: const EdgeInsets.only(left: 0),
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(chin.detail1,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              Text(chin.detail2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(chin.price,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
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
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                          child:
                                          Divider(
                                            thickness: 1,
                                            color: Colors.orangeAccent,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orangeAccent,
      //   //shape:ShapeBorder,
      //   child: Icon(Icons.shopping_cart,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       // MaterialPageRoute(builder: (context) =>  Cart(cart: widget.detail)),
      //       MaterialPageRoute(builder: (context) =>  Cart()),
      //     );
      //   },
      // ),
    );
  }
}