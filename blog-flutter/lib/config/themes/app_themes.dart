import 'package:blog/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double borderRadius = 10;
  static const Color primary = Color.fromRGBO(3, 125, 178, 1);
  static const Color background = Color.fromRGBO(239, 239, 239, 1);
  static const Color buttonBackground = Color.fromRGBO(41, 176, 219, 1);

  static final ThemeData lightTheme = ThemeData.light(useMaterial3: true)
      .copyWith(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppTheme.primary,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppTheme.buttonBackground,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: AppTheme.buttonBackground),
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: AppTheme.buttonBackground),
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
          primaryColor: primary,
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          cardColor: Colors.white,
          scaffoldBackgroundColor: background,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            backgroundColor: LightColors.primary,
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white, size: 30),
          ),
          tooltipTheme: TooltipThemeData(
            textStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius / 2)),
            ),
          ),
          cardTheme: CardTheme(
            elevation: 0,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: LightColors.primary),
            ),
            prefixIconColor: LightColors.grey,
            suffixIconColor: LightColors.primary,
            fillColor: Colors.white,
            filled: true,
            iconColor: LightColors.primary,
            contentPadding: const EdgeInsets.all(20),
            floatingLabelStyle: const TextStyle(color: LightColors.primary),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: LightColors.primary, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: LightColors.grey, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: LightColors.grey, width: 2)),
            // prefixIcon: Icon( Icons.verified_user_outlined ),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: LightColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            elevation: 0,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: LightColors.primary,
            foregroundColor: Colors.white,
            splashColor: LightColors.primary,
            hoverColor: LightColors.primary,
            focusColor: LightColors.primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          splashColor: Colors.grey[200],
          highlightColor: Colors.grey[100],
          dividerTheme: const DividerThemeData(
            color: LightColors.grey,
            thickness: 1,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)))),
          )),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(LightColors.primary),
          ),
          //    primaryIconTheme: const IconThemeData(color: LightColors.primary),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
            elevation: MaterialStateProperty.all<double>(0),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(LightColors.primary),
            surfaceTintColor:
                MaterialStateProperty.all<Color>(LightColors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))),
          )),
          listTileTheme: ListTileThemeData(
            iconColor: LightColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textColor: LightColors.darkGrey,
            selectedColor: LightColors.primary,
            selectedTileColor: LightColors.primary.withOpacity(0.2),
            tileColor: Colors.white,
            titleTextStyle: const TextStyle(
                color: LightColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          dialogTheme: DialogTheme(
            backgroundColor: LightColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 0,
          ),
          dialogBackgroundColor: LightColors.background,
          snackBarTheme: const SnackBarThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color(0xFF505050),
            contentTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          popupMenuTheme: PopupMenuThemeData(
              shadowColor: Colors.black.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              elevation: 2,
              color: Colors.white,
              textStyle: const TextStyle(
                color: LightColors.darkBlue,
                fontSize: 18,
              )),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: LightColors.primary,
          ),
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(LightColors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius * 2)))),
          )),
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(color: Colors.white.withOpacity(0.3)),
          ),
          dropdownMenuTheme: DropdownMenuThemeData(
              textStyle: const TextStyle(
                color: LightColors.primary,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
              menuStyle: MenuStyle(
                  maximumSize: MaterialStateProperty.all(Size.infinite),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)))),
              inputDecorationTheme: const InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                floatingLabelStyle: TextStyle(color: LightColors.primary),
                outlineBorder: BorderSide(color: Colors.transparent, width: 2),
              )));
  static final ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
  static final ThemeData disconnectedLight = ThemeData.light(useMaterial3: true)
      .copyWith(
          primaryColor: LightColors.red,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: LightColors.red,
            selectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: Color.fromARGB(255, 153, 9, 9)),
            selectedLabelStyle: TextStyle(color: Colors.white),
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: LightColors.red),
          cardColor: Colors.white,
          scaffoldBackgroundColor: background,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            backgroundColor: LightColors.red,
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white, size: 30),
          ),
          cardTheme: CardTheme(
            elevation: 0,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: LightColors.red),
            ),
            prefixIconColor: LightColors.grey,
            suffixIconColor: LightColors.red,
            fillColor: Colors.white,
            filled: true,
            iconColor: LightColors.red,
            contentPadding: const EdgeInsets.all(20),
            floatingLabelStyle: const TextStyle(color: LightColors.red),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: LightColors.red, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: LightColors.grey, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: LightColors.grey, width: 2)),
            // prefixIcon: Icon( Icons.verified_user_outlined ),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: LightColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            elevation: 0,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: LightColors.red,
            foregroundColor: Colors.white,
            splashColor: LightColors.red,
            hoverColor: LightColors.red,
            focusColor: LightColors.red,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          splashColor: Colors.grey[200],
          highlightColor: Colors.grey[100],
          tooltipTheme: TooltipThemeData(
            textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: BoxDecoration(
              color: LightColors.red,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          dividerTheme: const DividerThemeData(
            color: LightColors.grey,
            thickness: 1,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)))),
          )),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(LightColors.red),
          ),
          //    primaryIconTheme: const IconThemeData(color: LightColors.red),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
            elevation: MaterialStateProperty.all<double>(0),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(LightColors.red),
            surfaceTintColor: MaterialStateProperty.all<Color>(LightColors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))),
          )),
          listTileTheme: ListTileThemeData(
            iconColor: LightColors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textColor: LightColors.darkGrey,
            selectedColor: LightColors.red,
            selectedTileColor: LightColors.red.withOpacity(0.2),
            tileColor: Colors.white,
            titleTextStyle: const TextStyle(
                color: LightColors.darkRed,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          dialogTheme: DialogTheme(
            backgroundColor: LightColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 0,
          ),
          dialogBackgroundColor: LightColors.background,
          snackBarTheme: const SnackBarThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color(0xFF505050),
            contentTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          popupMenuTheme: PopupMenuThemeData(
              shadowColor: Colors.black.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              elevation: 2,
              color: Colors.white,
              textStyle: const TextStyle(
                color: LightColors.darkRed,
                fontSize: 18,
              )),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: LightColors.red,
          ),
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(LightColors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius * 2)))),
          )),
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(color: Colors.white.withOpacity(0.3)),
          ),
          dropdownMenuTheme: DropdownMenuThemeData(
              textStyle: const TextStyle(
                color: LightColors.red,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
              menuStyle: MenuStyle(
                  maximumSize: MaterialStateProperty.all(Size.infinite),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)))),
              inputDecorationTheme: const InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                floatingLabelStyle: TextStyle(color: LightColors.red),
                outlineBorder: BorderSide(color: Colors.transparent, width: 2),
              )));
}
