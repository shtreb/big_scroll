import 'package:big_scroll/domain/casse/blocs/list_products_bloc.dart';
import 'package:big_scroll/domain/casse/blocs/loading_bloc.dart';
import 'package:big_scroll/domain/enetry/product.dart';
import 'package:big_scroll/presenter/ui/activities/loading.dart';
import 'package:big_scroll/presenter/ui/activities/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Color(0xFF2F54EB),
        scaffoldBackgroundColor: Color(0xFF050505),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          backgroundColor: Color(0xFF050505),
          centerTitle: false
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white
          ),
          bodyText2: TextStyle(
            color: Colors.white
          )
        )
      ),
      onGenerateRoute: (settings) {
        if (settings.name == LoadingPage.path) {
          return MaterialPageRoute(
            settings: RouteSettings(name: LoadingPage.path),
            builder: (BuildContext context) {
              return BlocProvider<LoadingBloc>(
                create: (context) => LoadingBloc()..add(LoadingEvent.reload()),
                child: LoadingPage(),
              );
            }
          );
        }

        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
              settings: RouteSettings(name: MainPage.path),
              builder: (BuildContext context) {
                return BlocProvider<ListProductsBloc>(
                  create: (context) => ListProductsBloc(
                      (settings.arguments ?? []) as List<Product>
                  ),
                  child: MainPage(),
                );
              }
          );
        }
      },
      home: BlocProvider<LoadingBloc>(
        create: (context) => LoadingBloc()..add(LoadingEvent.reload()),
        child: LoadingPage(),
      ),
    );
  }

}