import 'dart:async';

import 'package:big_scroll/domain/casse/generator.dart';
import 'package:big_scroll/domain/enetry/product.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'loading_bloc.freezed.dart';

@freezed
abstract class LoadingState with _$LoadingState {

  const LoadingState._();

  factory LoadingState.init() = LoadingInitState;
  factory LoadingState.loading() = LoadingProgressState;
  factory LoadingState.success(List<Product> products) = LoadingSuccessState;
  factory LoadingState.fail(String message) = LoadingFailState;

}

@freezed
abstract class LoadingEvent with _$LoadingEvent {

  const LoadingEvent._();

  factory LoadingEvent.reload() = LoadingReloadEvent;

}

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingState.init());

  @override
  Stream<LoadingState> mapEventToState(
    LoadingEvent event,
  ) => event.when<Stream<LoadingState>>(
      reload: _reload
  );

  Stream<LoadingState> _reload() async* {
    yield LoadingState.loading();
    try {

      final Generator generator = Generator();
      List<Product> products = [];
      for (int i = 0; i < 100000; i++) {
        products.add(generator.generate());
      }

      yield LoadingState.success(products);
    } catch(e) {
      yield LoadingState.fail('Что то пошло не так');
    }
  }
}
