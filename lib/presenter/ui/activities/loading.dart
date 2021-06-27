import 'package:big_scroll/domain/casse/blocs/loading_bloc.dart';
import 'package:big_scroll/domain/enetry/product.dart';
import 'package:big_scroll/presenter/ui/activities/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatefulWidget {
  static const String path = '/loading';

  @override
  _LoadingPageState createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoadingBloc, LoadingState>(
        listener: (context, state) => state.maybeWhen<void>(
          success: _success,
          fail: _fail,
          orElse: () {}
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text('Загружем объекты'),
                  ),
                ),
                Text('Тестовое приложение')
              ],
            ),
          ),
        )
      ),
    );
  }

  void _success(List<Product> products) {
    Navigator.pushNamedAndRemoveUntil(
        context,
        MainPage.path,
        (Route<dynamic> route) => false,
        arguments: products
    );
  }

  void _fail(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ошибка'),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('Перезапустить'),
                onPressed: () {
                  BlocProvider.of<LoadingBloc>(context)
                      .add(LoadingEvent.reload());
                },
              )
            ],
          );
        }
    );
  }

}