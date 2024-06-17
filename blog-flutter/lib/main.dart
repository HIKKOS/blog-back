import 'package:blog/auth/auth_bloc.dart';
import 'package:blog/config/routes/app_routes.dart';
import 'package:blog/cubit/posts_cubit.dart';
import 'package:blog/utils/navigation_key.dart';
import 'package:blog/utils/preferences.dart';
import 'package:blog/views/login_user/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => PostsCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: AppRoutes.routes,
          navigatorKey: NavigationKey.navigatorKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginView(),
        ),
      ),
    );
  }
}
