import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddUpcomingMatch extends StatefulWidget {
  @override
  _AddUpcomingMatchState createState() => _AddUpcomingMatchState();
}

class _AddUpcomingMatchState extends State<AddUpcomingMatch> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> _teamList = <String>['Da-IICT','IIT-G','IIT-RAM','PDPU'];
  List<String> _roundList = <String>['Quarter finals','Semi Finals', 'Finals'];
  List<String> _venueList = <String>['SAC court-1','SAC court-2','Ground','Volleyball court','SAC','Basketball court'];
  List<String> _sportList = <String>['Badminton','Basketball','Cricket','Football','Table-Tennis','Volleyball'];

  String team1;
  String team2;
  String round;
  String sport;
  String dateTime;
  String venue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        child: Row(
          children: <Widget>[
            Flexible(
              child: CupertinoButton(
                child: Text("Go back", style: TextStyle(color: Colors.red),), onPressed: (){}),
            ),
            Flexible(
              child: CupertinoButton(
                child: Text("Create Match", style: TextStyle(color: Colors.red),), onPressed: (){}),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 18.0, top: 20.0,right: 18.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('Match Details', style: TextStyle(fontSize: 24.0, color: Colors.grey),),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.people,color: Colors.red,),
                        labelText: 'Team1',
                      ),
                      isEmpty: team1 == '',
                      child: Container(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: team1,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                team1 = newValue;
                                team1 = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _teamList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select a color';
                  },
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.people,color: Colors.red,),
                        labelText: 'Team2',
                      ),
                      isEmpty: team2 == '',
                      child: Container(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: team2,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                team2 = newValue;
                                team2 = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _teamList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select a color';
                  },
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.games ,color: Colors.red,),
                        labelText: 'Sport',
                      ),
                      isEmpty: sport == '',
                      child: Container(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: sport,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                sport = newValue;
                                sport = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _sportList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select a color';
                  },
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.location_on ,color: Colors.red,),
                        labelText: 'Venue',
                      ),
                      isEmpty: venue == '',
                      child: Container(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: venue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                venue = newValue;
                                venue = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _venueList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select a color';
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}