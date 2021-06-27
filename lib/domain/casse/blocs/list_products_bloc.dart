import 'dart:async';
import 'dart:ui';

import 'package:big_scroll/domain/casse/generator.dart';
import 'package:big_scroll/domain/enetry/product.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_products_bloc.freezed.dart';

class ListProductsState {

  final List<Product> products;
  final int length;
  final bool? hasSize;

  const ListProductsState({
    required this.products,
    required this.length,
    this.hasSize
  });

}

@freezed
abstract class ListProductsEvent with _$ListProductsEvent {

  const ListProductsEvent._();

  factory ListProductsEvent.setSizeItem(
      Size sizeItem,
      Size sizeScreen,
  ) = ListProductSetSizeItemEvent;
  factory ListProductsEvent.remove(int position) = ListProductRemoveEvent;
  factory ListProductsEvent.add(double position) = ListProuctsAddEvent;

}

class ListProductsBloc extends Bloc<ListProductsEvent, ListProductsState> {

  Size _sizeItem = Size( 0, 0),
      _sizeScreen = Size( 0, 0);

  final Generator _generator = Generator();

  ListProductsBloc(
      List<Product> products
  ) : super(ListProductsState(
    products: products,
    length: products.length,
  ));

  @override
  Stream<ListProductsState> mapEventToState(
    ListProductsEvent event,
  ) => event.when<Stream<ListProductsState>>(
    remove: _remove,
    add: _add,
    setSizeItem: _setSizeItem
  );

  Stream<ListProductsState> _remove(int position) async* {
    List<Product> products = state.products;
    products.removeAt(position);

    yield ListProductsState(
      products: products,
      length: products.length,
      hasSize: state.hasSize
    );
  }

  Stream<ListProductsState> _add(double position) async* {
    List<Product> products = state.products;
    Product product = _generator.generate();

    int width = _sizeScreen.width~/_sizeItem.width;
    int index = (position~/_sizeItem.height) * width;
    products.insert(index, product);

    if (index%2 == 1)
      index++;

    yield ListProductsState(
      products: products,
      length: products.length,
      hasSize: state.hasSize
    );
  }

  Stream<ListProductsState> _setSizeItem(
      Size sizeItem,
      Size sizeScreen
  ) async* {
    if (sizeItem.height == 0) return;

    _sizeItem = sizeItem;
    _sizeScreen = sizeScreen;
    yield ListProductsState(
        products: state.products,
        length: state.length,
        hasSize: true
    );
  }
}
