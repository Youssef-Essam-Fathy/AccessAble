import 'package:accessable/presentation/font_manager.dart';
import 'package:accessable/presentation/values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.lightPrimary,
    //cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //appBar theme
   appBarTheme: AppBarTheme(
     centerTitle: true,
     color: ColorManager.primary,
     elevation: AppSize.s4,
     shadowColor: ColorManager.lightPrimary,
   titleTextStyle: getRegularStyle(fontSize:FontSizeManager.s16,color:ColorManager.darkPrimary),),

   //button theme


   //text theme


   //input decoration theme(TextFormField)



  );
}

getRegularStyle({required double fontSize, required Color color}) {
}
