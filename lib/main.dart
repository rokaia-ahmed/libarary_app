
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libarary_app/modules/cubit/cubit.dart';
import 'package:libarary_app/modules/cubit/states.dart';
import 'package:libarary_app/modules/screen/splash_screen.dart';
import 'package:libarary_app/network/dio_helper.dart';

void main()async {
 await DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>BookCubit(InitialState())..getProgramming()..getMedical()..getDesign()..getArt()..getBusiness(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         title: 'Flutter Demo',
         theme: ThemeData(
          primarySwatch: Colors.blue,
           ),
          home: SplashScreen(),
      ),
    );
  }
}


