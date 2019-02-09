import 'package:flutter/material.dart';
import 'package:concoursadmin/badminton.dart';
import 'package:concoursadmin/basketball.dart';
import 'package:concoursadmin/cricket.dart';
import 'package:concoursadmin/tabletennis.dart';
import 'package:concoursadmin/volleyball.dart';
import 'package:concoursadmin/football.dart';

class UpcomingMatches extends StatefulWidget {

  String selectedSport;

  UpcomingMatches({this.selectedSport});

  @override
  _UpcomingMatchesState createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selectedSport){
      case 'Badminton':
        print(widget.selectedSport);
        return BadmintonUpcomingMatches();
        break;
      case 'Basketball':
        print(widget.selectedSport);
        return BasketballDetails();
        break;
      case 'Cricket':
        print(widget.selectedSport);
        return CricketDetails();
        break;
      case 'Football':
        print(widget.selectedSport);
        return FootballDetails();
        break;
      case 'Tabletennis':
        print(widget.selectedSport);
        return TabletennisDetails();
        break;
      case 'Volleyball':
        print(widget.selectedSport);
        return VolleyballDetails();
        break;
    }
    return null;
  }
}
