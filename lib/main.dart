import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:resep_mamah/cubit/cubit.dart';
import 'package:resep_mamah/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FoodCubit()),
      ],
      child: GetX.GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: GetX.Transition.fadeIn,
        home: Home(),
        getPages: [
          GetX.GetPage(
              name: '/signin',
              page: () => SignInPage(),
              transition: GetX.Transition.leftToRightWithFade,
              transitionDuration: Duration(milliseconds: 500)),
          GetX.GetPage(
              name: '/signup',
              page: () => SignUpPage(),
              transition: GetX.Transition.leftToRightWithFade,
              transitionDuration: Duration(milliseconds: 500)),
          GetX.GetPage(
              name: '/main',
              page: () => MainPage(),
              transition: GetX.Transition.leftToRightWithFade,
              transitionDuration: Duration(milliseconds: 500)),
          GetX.GetPage(
              name: '/details',
              page: () => DetailsPage(),
              transitionDuration: Duration(milliseconds: 500)),
          GetX.GetPage(
              name: '/recipe',
              page: () => RecipePage(),
              transitionDuration: Duration(milliseconds: 500)),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserLoaded) {
        if ((context.bloc<UserCubit>().state as UserLoaded).user == null) {
          return SignInPage();
        } else {
          context.bloc<FoodCubit>().getFoods();
          return MainPage();
        }
      }
      return OnboardPage();
    });
  }
}
