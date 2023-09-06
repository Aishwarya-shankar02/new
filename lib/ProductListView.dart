import 'package:designing/modelclass.dart';
import 'package:designing/providerr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  final List<Item> products;

  ProductListView({required this.products});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Item product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteModel = Provider.of<FavourateModel>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
         
          title: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 115,
                        child: Image.asset(product.image)),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        
                        child: Text(
                          product.productName,
                          style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Consumer<FavourateModel>(
                              builder: (context, favoriteModel, child) {
                                final isFavorite =
                                    favoriteModel.favourate.contains(product);
                                return IconButton(
                                  onPressed: () {
                                    if (isFavorite) {
                                      favoriteModel
                                          .removeFromFavorites(product);
                                    } else {
                                      favoriteModel.addToFavorites(product);
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : null,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
