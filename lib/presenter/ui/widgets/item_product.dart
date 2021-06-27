import 'package:big_scroll/domain/enetry/product.dart';
import 'package:big_scroll/presenter/ui/widgets/square_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

typedef SizeCallBack = void Function(Size size);

class ItemProduct extends StatefulWidget {

  final Product product;
  final SizeCallBack? onSizeCallBack;
  final VoidCallback onRemove;

  ItemProduct({
    Key? key,
    required this.product,
    required this.onRemove,
    this.onSizeCallBack
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemProductState();

}

class _ItemProductState extends State<ItemProduct> {

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    if (widget.onSizeCallBack != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        final RenderBox? renderBox = _key.currentContext
            ?.findRenderObject() as RenderBox?;
        final size = renderBox?.size ?? Size(0, 0);
        widget.onSizeCallBack!(size);
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        key: _key,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width),
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl: widget.product.imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  fadeInDuration: Duration(milliseconds: 0),
                  fadeOutDuration: Duration(milliseconds: 0),
                  progressIndicatorBuilder: (context, url, progress) {
                    return /*Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(),
                      ),
                    )*/ SizedBox.shrink();
                  },
                  errorWidget: (context, url, error) {
                    return GestureDetector(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Icon(Icons.error_outline, color: Colors.red),
                      ),
                      onTap: () {
                        setState((){});
                      },
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.product.title, style: TextStyle(
                      fontWeight: FontWeight.w700
                  ),),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SquareButton(
                icon: Icon(Icons.remove_circle),
                onPressed: widget.onRemove
            ),
          )
        ],
      ),
    );
  }

}