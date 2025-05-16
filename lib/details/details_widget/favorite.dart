import 'package:assigment_flutter/add_item/item_model.dart';
import 'package:assigment_flutter/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({required this.index, super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    return
      Consumer <ItemModel>(
        builder: (context, item, child) {
          final fav = Provider.of<FavoriteModel>(context, listen: true);
          final currentItem = item.items[index];

          return IconButton(onPressed: () {
            fav.isFavorite(currentItem);
          },
              icon: Icon(Icons.favorite,
                color: item.items[index].favorite ? Colors.red : Colors.grey,));
        },
      );
  }
}