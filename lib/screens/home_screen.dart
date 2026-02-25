import 'package:flutter/material.dart';
import 'package:store_app/main.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/details_screen.dart';
import 'package:store_app/screens/favorites_screen.dart';
import 'package:store_app/widgets/home/home_body.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // La couleur est maintenant gérée par le thème dans main.dart
      appBar: homeAppBar(context),
      body: HomeBody(),
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar( // L'appBar utilise maintenant l'AppBarTheme global
      title: const Text(
        "Welcome to Electrical store",
        style: TextStyle(fontSize:19),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            _showTransparentSearch(context);
          },
          icon: const Icon(Icons.search), // L'icône utilise la couleur du thème
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu), // L'icône utilise la couleur du thème
          onSelected: (value) {
            switch (value) {
              case 'favorites':
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesScreen()));
                break;
              case 'toggle_theme':
                final newMode = Theme.of(context).brightness == Brightness.dark
                    ? ThemeMode.light
                    : ThemeMode.dark;
                MyApp.of(context).changeTheme(newMode);
                break;
              case 'Idioma':
                // Logique future pour changer la langue
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            return [
              const PopupMenuItem(
                value: 'favorites',
                child: Text("Favorites ❤️", style: TextStyle(fontSize: 20)),
              ),
              PopupMenuItem(
                  value: 'toggle_theme',
                  child: Text(isDarkMode ? "Mode clair ◽️" : "Mode sombre ◼️",
                      style: const TextStyle(fontSize: 20,))),
              const PopupMenuItem(
                value: 'Idioma',
                child: Text("Idioma : 🇪🇸", style: TextStyle(fontSize: 20)),
              ),
            ];
          },
        ),
      ],
    );
  }

  void _showTransparentSearch(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // Couleur de fond semi-transparente
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            type: MaterialType.transparency,
            child: SafeArea(
              child: _SearchWidget(),
            ),
          ),
        );
      },
    );
  }
}

class _SearchWidget extends StatefulWidget {
  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<_SearchWidget> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final List<Product> suggestionList = query.isEmpty
        ? []
        : products.where((p) => p.title.toLowerCase().contains(query.toLowerCase())).toList();

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            onChanged: (value) => setState(() => query = value),
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => Navigator.pop(context),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
          if (suggestionList.isNotEmpty)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: suggestionList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(suggestionList[index].images[0]),
                    title: Text(suggestionList[index].title),
                    onTap: () {
                      Navigator.pop(context); // Ferme la recherche
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: suggestionList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
