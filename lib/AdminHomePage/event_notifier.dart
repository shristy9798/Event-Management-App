


import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'allEvent.dart';

class EventNotifier with ChangeNotifier{
  List<All_Events_List> _eventList=[];
   late All_Events_List _currentevent;
  UnmodifiableListView<All_Events_List> get list=> UnmodifiableListView(_eventList);
  All_Events_List get currentevent=> _currentevent;

  set list(List<All_Events_List> list)
  {

    _eventList=list;
    notifyListeners();
  }
  set currentevent(All_Events_List food)
  {
    _currentevent=food;
    notifyListeners();
  }

}