import 'package:flutter/material.dart';
import 'package:notes/theme/theme.dart';

class themeProvider extends ChangeNotifier{
  //initial light mode
  ThemeData _themeData = lightmode;

  //get method access to other part of code
  ThemeData get themedata => _themeData;

  //method to see of it is in dark mode
  bool get isdarkMode => _themeData == darkmode;

  //set to new theme
  set themedata(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  //set or switch the theme
  void toggleTheme(){
    if( _themeData == lightmode){
      themedata = darkmode;
    }
    else{
      themedata = lightmode;
    }
  }

}