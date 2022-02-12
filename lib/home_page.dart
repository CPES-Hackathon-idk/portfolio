import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/project_page.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey key = GlobalKey();

  // double imageW = 400;
  bool _isHovering = false;
  bool _isHovering2 = false;
  // double imageH = 300;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'I9_Y9tvUXpQ',
    params: YoutubePlayerParams(
      showControls: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isDesktop = screenWidth > 820;
    final controller = PageController(initialPage: 0);
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController message = TextEditingController();
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: email.text, queryParameters: {
      'subject': '${subject.text}',
      'message': '${message.text}',
    });
    return Scaffold(
      backgroundColor: isLight ? kLightBgColor : kDarkBgColor,
      appBar: AppBar(
        backgroundColor: isLight ? kLightBgColor : kDarkBgColor,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.animateTo(controller.position.minScrollExtent,
                        curve: Curves.easeInOutCubic,
                        duration: Duration(milliseconds: 500));
                  });
                },
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AutoSizeText(
                    'SARAH',
                    style: TextStyle(
                      color: kDarkBgColor,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                    minFontSize: 20,
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    controller.animateTo(controller.position.maxScrollExtent,
                        curve: Curves.easeInOutCubic,
                        duration: Duration(milliseconds: 500));
                    //print(controller.position.pixels);
                  });
                },
                child: Text(
                  'Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4C69AB),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            //scrollDirection: Axis.vertical,
            //controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 100, bottom: 100),
                child: Container(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 50),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'HELLO',
                                style: TextStyle(
                                  color: kLightTextColor,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  fontSize: isDesktop ? 35 : 25,
                                ),
                                minFontSize: 20,
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'I\'M SARAH',
                                style: TextStyle(
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: screenWidth > 820 ? 100 : 30,
                                ),
                                minFontSize: 20,
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'I am intrested in capturing the world around me with my trusty camera.',
                                style: TextStyle(
                                  color: kLightSecondTextColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: isDesktop ? 18 : 12,
                                ),
                                minFontSize: 12,
                                maxLines: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: FlatButton(
                                  color: kLightTextColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  onPressed: () {
                                    // setState(() {
                                    //   RenderBox box =
                                    //       key.currentContext.findRenderObject();
                                    //   Offset position = box.localToGlobal(Offset
                                    //       .zero); //this is global position
                                    //   double x = position.dx;
                                    //   controller.animateTo(x,
                                    //       curve: Curves.easeInOutCubic,
                                    //       duration:
                                    //           Duration(milliseconds: 500));
                                    // });
                                    setState(() {
                                      controller.animateTo(
                                          controller.position.maxScrollExtent,
                                          curve: Curves.easeInOutCubic,
                                          duration:
                                              Duration(milliseconds: 500));
                                      //print(controller.position.pixels);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Lets Talk!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isDesktop ? 20 : 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'lib/assets/Images/profilepic.png',
                        //width: screenWidth / 2,
                        width: 500,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                height: 300,
                child: YoutubePlayerIFrame(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: kLightTextColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 100,
                          left: screenWidth / 5,
                          right: screenWidth / 5),
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Hi 👋, Nice to meet you.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isDesktop ? 50 : 30,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            minFontSize: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60, bottom: 70),
                            child: AutoSizeText(
                              'I\'m a multi-talented person with over 1+ years of experience in photography. I have a diverse set of skills, starting from design to natural and city landscape using my Sony A7R III. I prefer to keep learning, continue challenging myself and do interesting things that matter. I’m now a Judge at Bird Photographer of the Year Competition and capturing the beautiful world around me✨.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isDesktop ? 24 : 15,
                                fontWeight: FontWeight.w600,
                              ),
                              minFontSize: 10,
                              maxLines: 10,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              //key: key,
                              //height: (screenWidth / 100) * 50,
                              //width: screenWidth / 0.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, top: 20, left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 20),
                                      child: AutoSizeText(
                                        'PORTFOLIO',
                                        style: TextStyle(
                                          color: kLightTextColor,
                                          fontSize: isDesktop ? 50 : 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        minFontSize: 20,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Container(
                                            width: 215,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 85,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFAF9F9),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Icon(
                                                      Icons.park_outlined,
                                                      color: kLightTextColor,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  'Nature',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize:
                                                          isDesktop ? 20 : 16,
                                                      color: kLightTextColor),
                                                  minFontSize: 10,
                                                ),
                                                AutoSizeText(
                                                  'I love capturing the animal kingdom, but birds have a special place in my heart.',
                                                  style: TextStyle(
                                                    color:
                                                        kLightSecondTextColor,
                                                    fontSize:
                                                        isDesktop ? 18 : 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  minFontSize: 10,
                                                  maxLines: 6,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Container(
                                            width: 215,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 85,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFAF9F9),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Icon(
                                                      Icons
                                                          .location_city_outlined,
                                                      color: kLightTextColor,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  'City',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize:
                                                          isDesktop ? 20 : 16,
                                                      color: kLightTextColor),
                                                  minFontSize: 10,
                                                ),
                                                AutoSizeText(
                                                  'Cities are the jungles of the modern world, there’s always something going on.',
                                                  style: TextStyle(
                                                    color:
                                                        kLightSecondTextColor,
                                                    fontSize:
                                                        isDesktop ? 18 : 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  minFontSize: 10,
                                                  maxLines: 6,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Container(
                                            width: 215,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 85,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFAF9F9),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Icon(
                                                      Icons.landscape_outlined,
                                                      color: kLightTextColor,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  'Landscape',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize:
                                                          isDesktop ? 20 : 16,
                                                      color: kLightTextColor),
                                                  minFontSize: 10,
                                                ),
                                                AutoSizeText(
                                                  'Landscapes are exotic and calming, but the alps have a unique charm around it.',
                                                  style: TextStyle(
                                                    color:
                                                        kLightSecondTextColor,
                                                    fontSize:
                                                        isDesktop ? 18 : 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  minFontSize: 10,
                                                  maxLines: 6,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
//TODO: Add more projects

              OverflowBar(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectPage(
                          name: 'Project 1',
                          image: 'lib/assets/Images/project1.png',
                          description:
                              'I love capturing the animal kingdom, but birds have a special place in my heart.',
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        MouseRegion(
                          onEnter: (event) => setState(() {
                            _isHovering = true;
                          }),
                          onExit: (event) => setState(() {
                            _isHovering = false;
                          }),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: _isHovering ? 350 : 300,
                              width: _isHovering ? 450 : 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // padding: EdgeInsets.all(2),
                              child: Hero(
                                tag: 'Project 1',
                                child: Image.asset(
                                    'lib/assets/Images/project1.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        AutoSizeText(
                          'Project 1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop ? 24 : 15,
                            fontWeight: FontWeight.w600,
                          ),
                          minFontSize: 10,
                          maxLines: 10,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectPage(
                          name: 'Project 2',
                          image: 'lib/assets/Images/project2.png',
                          description:
                              'Landscapes are exotic and calming, but the alps have a unique charm around it.',
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        MouseRegion(
                          onEnter: (event) => setState(() {
                            _isHovering2 = true;
                          }),
                          onExit: (event) => setState(() {
                            _isHovering2 = false;
                          }),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: _isHovering2 ? 350 : 300,
                              width: _isHovering2 ? 450 : 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // padding: EdgeInsets.all(2),
                              child: Hero(
                                tag: 'Project 2',
                                child: Image.asset(
                                    'lib/assets/Images/project2.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        AutoSizeText(
                          'Project 2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop ? 24 : 15,
                            fontWeight: FontWeight.w600,
                          ),
                          minFontSize: 10,
                          maxLines: 10,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              AutoSizeText(
                'TESTIMONIALS',
                style: TextStyle(
                  color: kLightTextColor,
                  fontSize: isDesktop ? 50 : 35,
                  fontWeight: FontWeight.w800,
                ),
                minFontSize: 20,
                maxLines: 1,
              ),

              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                          child: Image.asset(
                        'lib/assets/Images/photo1.png',
                        height: 300,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Lovley Photographs, \nthe emotions and power that they have is outstanding',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop ? 24 : 15,
                              fontWeight: FontWeight.w900,
                            ),
                            minFontSize: 10,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                          ),
                          AutoSizeText(
                            '-Kuwaiti Society for Photography art',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop ? 24 : 15,
                              fontWeight: FontWeight.w600,
                            ),
                            minFontSize: 10,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                          child: Image.asset(
                        'lib/assets/Images/photo2.png',
                        height: 300,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Amazing person, \nreally talented! We are honoured that you are a part of our award.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop ? 24 : 15,
                              fontWeight: FontWeight.w900,
                            ),
                            minFontSize: 10,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                          ),
                          AutoSizeText(
                            '-Bird Photographer of The Year Awards',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop ? 24 : 15,
                              fontWeight: FontWeight.w600,
                            ),
                            minFontSize: 10,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 100),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           ClipOval(
              //               child: Image.asset(
              //             'lib/assets/Images/photo1.png',
              //             height: 300,
              //           )),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               AutoSizeText(
              //                 'Lovley Photographs, the emotions and power that they have is outstanding',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: isDesktop ? 24 : 15,
              //                   fontWeight: FontWeight.w900,
              //                 ),
              //                 minFontSize: 10,
              //                 maxLines: 10,
              //                 textAlign: TextAlign.left,
              //               ),
              //               AutoSizeText(
              //                 '-Kuwaiti Society for Photography art',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: isDesktop ? 24 : 15,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //                 minFontSize: 10,
              //                 maxLines: 10,
              //                 textAlign: TextAlign.left,
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Row(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           ClipOval(
              //               child: Image.asset(
              //             'lib/assets/Images/photo2.png',
              //             height: 300,
              //           )),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               AutoSizeText(
              //                 'Amazing person, really talented! We are honoured that you are a part of our award.',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: isDesktop ? 24 : 15,
              //                   fontWeight: FontWeight.w900,
              //                 ),
              //                 minFontSize: 10,
              //                 maxLines: 10,
              //                 textAlign: TextAlign.left,
              //               ),
              //               AutoSizeText(
              //                 '-Bird Photographer of The Year Awards',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: isDesktop ? 24 : 15,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //                 minFontSize: 10,
              //                 maxLines: 10,
              //                 textAlign: TextAlign.left,
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ClipOval(child: Image.asset('lib/assets/Images/photo1.png', height: 300,)),
              //     SizedBox(width: 20,),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         AutoSizeText(
              //                     'Lovley Photographs, the emotions and power that they have is outstanding',
              //                     style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: isDesktop ? 24 : 15,
              //                       fontWeight: FontWeight.w900,
              //                     ),
              //                     minFontSize: 10,
              //                     maxLines: 10,
              //                     textAlign: TextAlign.left,
              //                   ),
              //         AutoSizeText(
              //                     '-Kuwaiti Society for Photography art',
              //                     style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: isDesktop ? 24 : 15,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                     minFontSize: 10,
              //                     maxLines: 10,

              //                     textAlign: TextAlign.left,
              //                   ),
              //       ],
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ClipOval(child: Image.asset('lib/assets/Images/photo2.png', height: 300,)),
              //     SizedBox(width: 20,),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         AutoSizeText(
              //                     'Amazing person, really talented! We are honoured that you are a part of our award.',
              //                     style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: isDesktop ? 24 : 15,
              //                       fontWeight: FontWeight.w900,
              //                     ),
              //                     minFontSize: 10,
              //                     maxLines: 10,
              //                     textAlign: TextAlign.left,
              //                   ),
              //         AutoSizeText(
              //                     '-Bird Photographer of The Year Awards',
              //                     style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: isDesktop ? 24 : 15,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                     minFontSize: 10,
              //                     maxLines: 10,

              //                     textAlign: TextAlign.left,
              //                   ),
              //       ],
              //     ),
              //   ],
              // ),

              Container(
                //height: screenHeight,
                child: Column(
                  children: [
                    AutoSizeText(
                      'GET IN TOUCH',
                      style: TextStyle(
                        color: kLightTextColor,
                        fontSize: isDesktop ? 50 : 35,
                        fontWeight: FontWeight.w800,
                      ),
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Intrested in working together?\nFeel free to contact me for any project or collaboration.',
                      style: TextStyle(
                        color: kLightSecondTextColor,
                        fontWeight: FontWeight.w900,
                        fontSize: isDesktop ? 18 : 12,
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxLines: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: Container(
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30,
                                top: 20,
                                left: 20,
                                right: 20,
                              ),
                              child: Container(
                                child: Image.asset(
                                  'lib/assets/Images/Image2.png',
                                  width: 500,
                                ),
                              ),
                            ),
                            //Text('data'),
                            Container(
                              width: 700,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //width: 640,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 20, top: 20),
                                            child: Container(
                                              //   width: 320,
                                              child: TextField(
                                                controller: name,
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                  labelText: 'Name',
                                                  labelStyle: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xff4C69AB),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xffD8DEEE),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4C69AB),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4C69AB),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 20, top: 20),
                                            child: Container(
                                              // width: 320,
                                              child: TextField(
                                                controller: email,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: 'Email',
                                                  labelStyle: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xff4C69AB),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xffD8DEEE),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4C69AB),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4C69AB),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      bottom: 20,
                                    ),
                                    child: Container(
                                      //   width: 320,
                                      child: TextField(
                                        controller: subject,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Subject',
                                          labelStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff4C69AB),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xffD8DEEE),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff4C69AB),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff4C69AB),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      bottom: 20,
                                    ),
                                    child: Container(
                                      //   width: 320,
                                      child: TextField(
                                        controller: message,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          labelText: 'Message',
                                          labelStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff4C69AB),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xffD8DEEE),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff4C69AB),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff4C69AB),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: FlatButton(
                                      color: kLightTextColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      onPressed: () {
                                        print(message.text);
                                        if (email != null &&
                                            message != null &&
                                            subject != null) {
                                          print(Uri(
                                              scheme: 'mailto',
                                              path: email.text,
                                              queryParameters: {
                                                'subject': '${subject.text}',
                                                'message': '${message.text}',
                                              }).toString());
                                          //launch(_emailLaunchUri.toString());
                                          launch(
                                              'mailto:name@email.com?subject=${subject.text}&body=${message.text}');
                                          // launch(Uri(
                                          //     scheme: 'mailto',
                                          //     path: email.text,
                                          //     queryParameters: {
                                          //       'subject': '${subject.text}',
                                          //       'body':
                                          //           'Hi 👋, I\'m ${name.text} \n ${message.text}',
                                          //     }).toString());
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Send',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: isDesktop ? 20 : 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xffD8DEEE),
                      height: 200,
                      width: screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Image.asset(
                                    'lib/assets/Images/github.png',
                                    height: 45,
                                    width: 45,
                                  ),
                                  onTap: () =>
                                      launch('https://github.com/Munaikh'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      'lib/assets/Images/instagram.png',
                                      height: 45,
                                      width: 45,
                                    ),
                                    onTap: () => launch(
                                        'https://www.instagram.com/developer.kw/'),
                                  ),
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                    'lib/assets/Images/twitter .png',
                                    height: 45,
                                    width: 45,
                                  ),
                                  onTap: () =>
                                      launch('https://twitter.com/a_munaikh'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Made with ❤️ by idk',
                              style: TextStyle(
                                  color: Color(0xff25499A),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
