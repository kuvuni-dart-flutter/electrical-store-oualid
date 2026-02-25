import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filtrer les produits pour ne garder que les favoris
    final favoriteProducts = products.where((p) => p.isFavorite).toList();

    return Scaffold(
      // La couleur est maintenant gérée par le thème dans main.dart
      appBar: AppBar(
        elevation: 0,
        title: Text("Favorites"),
        // L'iconTheme est géré par l'AppBarTheme global
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text("No favorites yet", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                  child: ListTile(
                    leading: Image.asset(product.images[0]),
                    title: Text(product.title),
                    subtitle: Text("${product.price}€"),
                    trailing: Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}