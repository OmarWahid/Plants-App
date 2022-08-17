import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_orange/modules/home_screen/home_cubit/plants_cubit.dart';
import 'package:plants_orange/modules/login_screen/login_cubit/login_cubit.dart';
import 'package:plants_orange/modules/splash_screen/splash_screen.dart';
import 'package:plants_orange/shared/bloc_observer.dart';
import 'package:plants_orange/shared/component.dart';

import 'network/cache_helper.dart';
import 'network/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token');
  print(token);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PlantsCubit()..getSeeds()..getPlants()..getTools()..getAll()..getUser(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),              ),

            ),
            home: const SplashScreen(),
            // home: const PlantsLayout(),
          ),
        );
      },
    );
  }
}
