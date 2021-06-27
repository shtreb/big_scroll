import 'dart:math';

import 'package:big_scroll/domain/enetry/product.dart';

class Generator {

  List<String> titles = [
    'Вкусный фрукт',
    'По акции',
    'Возможно красный',
    'Целый',
    'Приятный аромат',
    'Хит недели',
    'Простой',
    'Породистый',
    'Привитый',
    'Сытный',
    'Необыкновенный',
    'Шалавливый',
    'Цветастый',
    'Охлажденный',
    'Улыбчивый',
    'Костлявый'
  ];

  List<String> paths = [
    'https://www.herbalteashop.ir/wp-content/uploads/2019/10/orange.jpg',
    'https://domoidostavim.ru/images/static/products/d447cc03-5d12-46b5-bb08-e8f663ff0a2d.jpg',
    'https://library.kissclipart.com/20180901/lte/kissclipart-grapefruit-png-clipart-juice-fruit-a56fdbfa2cfe97b5.jpg',
    'https://w7.pngwing.com/pngs/829/960/png-transparent-juice-fruit-juicy-strawberry-peach-food-fruits-natural-foods-food-fruit-thumbnail.png',
    'https://img.favpng.com/19/23/7/persian-lime-lemon-juice-key-lime-png-favpng-EKFWirggvsVCXd219BdAwpPES.jpg',
    'https://cashcow-cdn.azureedge.net/images/2af71b77-2ec0-4ee5-bc82-9a7d2fd11da6_500.jpg',
    'https://avito.md/uploads/usr/70/7040.jpg',
    'http://clipart-library.com/images_k/healthy-food-transparent/healthy-food-transparent-18.png',
    'https://rukminim1.flixcart.com/image/800/800/joq2qa80/fruit-vegetable-basket/2/v/f/sdd6as66gg-pelo-original-imaf8qzjxbpbmnzq.jpeg?q=90',
    'https://www.siparisevde.com/cdn/2/700/700/images/urunler/5ec2adb30341c-9516.jpg',
    'https://1.bp.blogspot.com/-FROIAHSBmmY/XkJy1F0YsSI/AAAAAAAAKKs/zxNGIHIhYxkgvBEv2e49VsaaGY_FD2iTQCLcBGAsYHQ/s640/19708115.jpg',
    'https://img.favpng.com/17/11/15/watercolor-flower-background-png-favpng-uRQdQP1qiXHV469WFmhvDiFWS.jpg',
    'https://thumbs.dreamstime.com/b/%D1%81%D0%B5%D1%80%D0%B4%D1%86%D0%B5-%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B5-%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85-%D1%84%D1%80%D1%83%D0%BA%D1%82%D0%BE%D0%B2-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%D0%B4%D0%B5-d-%D0%BE%D1%80%D0%B0%D0%BD%D0%B6%D0%B5%D0%B2%D1%8B%D0%B9-194569242.jpg',
    'https://agrotorg.net/imgs/board/58/305058-1.jpg',
    'https://www.siparisevde.com/cdn/2/700/700/images/urunler/5ec2adb30341c-9516.jpg',
  ];

  Product generate() {
    final titleId = Random().nextInt(15);
    final imagePathId = Random().nextInt(15);

    return Product(
      title: titles[titleId],
      imagePath: paths[imagePathId]
    );
  }

}