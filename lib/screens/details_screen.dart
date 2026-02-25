import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utilise la couleur de fond du thème principal (kPrimaryColor en clair, noir en sombre)
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: detailsAppbar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  AppBar detailsAppbar(BuildContext context) {
    return AppBar(
      // Utilise la couleur de surface qui change avec le thème
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.bodyLarge?.color),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        "Atrás",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
