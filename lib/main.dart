import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:training/bloc_observer.dart';
import 'package:training/cache_helper.dart';
import 'package:training/constants.dart';
import 'package:training/counter.dart';
import 'package:training/cubit.dart';
import 'package:training/cubit/cubit_newlayout.dart';
import 'package:training/dio_helper.dart';
import 'package:training/news_layout.dart';
import 'package:training/states.dart';
import 'package:training/themes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  Bloc.observer = MyBlocObserver();
  dioHelper.int();
  await cacheHelper.init();
  dynamic isDark = cacheHelper.getData(key: 'isDark');
  Widget widget;
 // dynamic onBoarding = cacheHelper.getData(key: 'onBoarding');
  //token = cacheHelper.getData(key: 'token');
  //uId = cacheHelper.getData(key: 'uId');
  //print(token);
  // if(onBoarding != null)
  //   {
  //     if(token!=null) widget = ShopLayOut();
  //     else widget = LoginScreen();
  //   }else
  //     {
  //       widget = onBoarding();
  //     }
  runApp(MyApp(
      isDark:isDark,
    //startWidget: //ShopLayOut(),
  ));
}

class MyApp extends StatelessWidget {
final dynamic isDark ;
//final Widget startWidget;
MyApp({this.isDark,/*required this.startWidget*/});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewCubit()..getBuisness()..getSports()/*..getScience(),*/),
        BlocProvider(
            create: (BuildContext context) => counterCubit()..changeAppMode(
            fromShared: isDark
      ),
        ),
        // BlocProvider(
        //     create: (BuildContext context) => ShopCubit()..getHomeData()..getCategories()..getFavorits()..getUserData()
        // ),
        // BlocProvider(
        //     create: (BuildContext context) => SocialCubit()..getUserData()
        // ),
         ],
        child: BlocConsumer<counterCubit, counterState>(
          listener: (context,state){},
          builder:(context,state){
            return MaterialApp(
            //   builder:(context, child) => ResponsiveWrapper.builder(
            //     child,
            //     maxWidth: 1200,
            //     minWidth: 480,
            //     defaultScale: true,
            //     breakpoints: [
            //       ResponsiveBreakpoint.resize(480, name: MOBILE),
            //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
            //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            //     ],
            //     background: Container(color: Color(0xFFF5F5F5))),
            // initialRoute: "/",
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black12,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black12,
                        statusBarIconBrightness: Brightness.light
                    ),
                    backgroundColor: Colors.black12,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor:Colors.black12,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                ),
                fontFamily: 'josef',
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor:Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                ),
                fontFamily: 'josef',
              ),
              themeMode: counterCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,

              home:NewsLayout(),
            );
          } ,
        ),
    );
  }
}