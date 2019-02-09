import 'package:flutter/material.dart';

// Concours Files
import 'package:concoursadmin/scoreboard.dart';
import 'package:concoursadmin/upcomingmatches.dart';
import 'package:concoursadmin/about.dart';
import 'package:concoursadmin/pastmatches.dart';
import 'package:concoursadmin/addupcomingmatch.dart';

@immutable
class Page extends StatelessWidget {
  final String title;

  Page(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: const Color(0xFFDC143C),
                  fontSize: 20.0
              ),
            )
        )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController;
  String currentTitle;

  final List<String> titleName = [
    "Scoreboard",
    "Past Matches",
    "Upcoming Matches",
  ];

  TabController sportTabController;
  String currentSport;

  final List<String> sportsList = ["Badminton","Basketball","Cricket","Football","Tabletennis","Volleyball"];

  void initState(){
    super.initState();
    currentTitle = titleName[0];
    currentSport = sportsList[0];
    tabController = new TabController(
        length: 5,
        vsync: this
    );
    sportTabController = new TabController(
        length: 6,
        vsync: this
    );
    tabController.addListener(_handleSelected);
    sportTabController.addListener(_handleSelected);
  }

  void _handleSelected(){
    setState(() {
      currentTitle = titleName[tabController.index];
      currentSport = sportsList[sportTabController.index];
      print(currentSport);
    });
  }

  void dispose(){
    super.dispose();
    tabController.dispose();
    sportTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: new TabBar(
            controller: sportTabController,
            tabs: <Tab>[
              new Tab(
                icon: new Icon(
                    IconData(0xe902, fontFamily: "Badminton"),
                    color: Colors.red
                ),
              ),
              new Tab(
                icon: new Icon(
                    IconData(0xe900, fontFamily: "Basketball"),
                    color: Colors.red
                ),
              ),
              new Tab(
                icon: new Icon(
                    IconData(0xe901, fontFamily: "Cricket"),
                    color: Colors.red
                ),
              ),
              new Tab(
                icon: new Icon(
                    IconData(0xe903, fontFamily: "Football"),
                    color: Colors.red
                ),
              ),
              new Tab(
                icon: new Icon(
                    IconData(0xe904, fontFamily: "Tabletennis"),
                    color: Colors.red
                ),
              ),
              new Tab(
                icon: new Icon(
                    IconData(0xe905, fontFamily: "Volleyball"),
                    color: Colors.red
                ),
              ),
            ]
        ),
        title: Text(
            currentTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.red
            )
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.red
        ),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 70.0,
                        height: 70.0,
                        margin: EdgeInsets.only(
                            bottom: 15.0
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                                "./assets/logo.png",
                                height: 50.0,
                                width: 50.0
                            )
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Concours '18",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    )
                  ]
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              title: Row(
                  children: <Widget> [
                    Icon(Icons.watch_later, color: Colors.red,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                        child: Text('Add Upcoming Match')),
                  ]
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddUpcomingMatch()
                    )
                );
              },
            ),
            ListTile(
              title: Row(
                  children: <Widget> [
                    Icon(Icons.info, color: Colors.red,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                        child: Text(' About Us')),
                  ]
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutPage()
                    )
                );
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ScoreBoard(selectedSport: currentSport,),
          PastMatches(selectedSport: currentSport,),
          UpcomingMatches(selectedSport: currentSport,),
        ],
        controller: tabController
      ),
      bottomNavigationBar: Material(
          color: Colors.redAccent,
          child: TabBar(
              controller: tabController,
              tabs: <Widget>[
                Tab(
                  child: Icon(Icons.insert_chart),
                ),
                Tab(
                    child: Icon(Icons.trending_up)
                ),
                Tab(
                    child: Icon(Icons.schedule)
                ),
              ]
          )
      ),
    );
  }
}