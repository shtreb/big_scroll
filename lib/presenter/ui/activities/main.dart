import 'package:big_scroll/domain/casse/blocs/list_products_bloc.dart';
import 'package:big_scroll/presenter/ui/widgets/item_product.dart';
import 'package:big_scroll/presenter/ui/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  static const String path = '/main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
        actions: [
          Center(
            child: SquareButton(
              icon: Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<ListProductsBloc>(context).add(
                    ListProductsEvent.add(_scrollController.position.pixels)
                );
              },
            ),
          )
        ],
      ),
      body: BlocBuilder<ListProductsBloc, ListProductsState>(
        builder: (context, state) {
          return GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3/4,
              ),
              itemCount: state.length,
              itemBuilder: (context, index) {
                return ItemProduct(
                  product: state.products[index],
                  onRemove: () {
                    BlocProvider.of<ListProductsBloc>(context).add(
                      ListProductsEvent.remove(index)
                    );
                  },
                  onSizeCallBack: index == 0 && !(state.hasSize ?? false) ? (Size size) {
                    BlocProvider.of<ListProductsBloc>(context).add(
                      ListProductsEvent.setSizeItem(
                          size,
                          MediaQuery.of(context).size
                      )
                    );
                  } : null,
                );
              }
          );
        },
      ),
    );
  }

}