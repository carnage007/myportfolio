// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myportfolio/Model/method.dart';
import 'package:myportfolio/UI/about.dart';
import 'package:myportfolio/UI/feature_project.dart';
import 'package:myportfolio/UI/work.dart';
import 'package:myportfolio/Widget/app_bar_title.dart';
import 'package:myportfolio/Widget/custom_text.dart';
import 'package:myportfolio/Widget/main_title.dart';
import 'package:myportfolio/Widget/osimage.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  // final scrollDirection = Axis.vertical;

  bool isExpand = true;

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        primary: true,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Navigation bar
            Container(
              height: size.height * 0.14,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.change_history,
                        size: 32.0,
                        color: Color(0xff64FFDA),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DefaultTabController(
                          length: 4,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            onTap: (index) async {
                              _scrollToIndex(index);
                            },
                            tabs: [
                              Tab(
                                child: AppBarTitle(
                                  text: 'About',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Experience',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Education',
                                ),
                              ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Contact Me',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Card(
                        elevation: 4.0,
                        color: Color(0xff64FFDA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(0.85),
                          height: size.height * 0.07,
                          width: size.height * 0.20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff0A192F),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: TextButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                "Resume",
                                style: TextStyle(
                                  color: Color(0xff64FFDA),
                                ),
                              ),
                            ),
                            onPressed: () {
                              method.launchURL("Link to CV");
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // || End App Bar ||

            Row(
              children: [
                //||Social Link | left start
                Container(
                  width: size.width * 0.09,
                  height: size.height - 82,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL("https://github.com");
                          }),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL("https://twitter.com");
                          }),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin),
                        color: Color(0xffffA8B2D1),
                        onPressed: () {
                          method.launchURL("https://www.linkedin.com/");
                        },
                        iconSize: 16.0,
                      ),
                      IconButton(
                          icon: Icon(Icons.call),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            //method.launchCaller();
                          }),
                      IconButton(
                          icon: Icon(Icons.mail),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            //method.launchEmail();
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: size.height * 0.20,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),

                //||Social Link | Ends

                //// Main body start |
                Expanded(
                  child: Container(
                    height: size.height - 82,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomScrollView(
                        controller: _autoScrollController,
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                //// |||| main head screen
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height * .06,
                                    ),
                                    CustomText(
                                      text: "Hi, my name is",
                                      textsize: 16.0,
                                      color: Color(0xff41FBDA),
                                      letterSpacing: 3.0,
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    CustomText(
                                      text: "Sajid Hussain",
                                      textsize: 68.0,
                                      color: Color(0xffCCD6F6),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    CustomText(
                                      text: "text for wat I am doing",
                                      textsize: 56.0,
                                      color: Color(0xffCCD6F6).withOpacity(0.6),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      height: size.height * .04,
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          "Based in Rennes, FR specializing in \nbuilding (and occasionally designing) exceptional \napplications, and everything in between.",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16.0,
                                            letterSpacing: 2.75,
                                            wordSpacing: 0.75,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .12,
                                    ),

                                    //get in touch text
                                    InkWell(
                                      onTap: () {
                                        method.launchEmail();
                                      },
                                      hoverColor:
                                          Color(0xff64FFDA).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.09,
                                        width: size.width * 0.14,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff64FFDA),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Text(
                                          "Get In Touch",
                                          style: TextStyle(
                                            color: Color(0xff64FFDA),
                                            letterSpacing: 2.75,
                                            wordSpacing: 1.0,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.20,
                                    ),
                                  ],
                                ),

                                // End of head Screen

                                // Start the about me section
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
