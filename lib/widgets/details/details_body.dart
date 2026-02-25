import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/details/color_dot.dart';
import 'package:store_app/widgets/details/product_image.dart';

class DetailsBody extends StatefulWidget {
  final Product product;

  const DetailsBody({super.key, required this.product});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  int _selectedImage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedImage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                height: size.width * 0.8,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _selectedImage = value;
                        });
                      },
                      itemCount: widget.product.images.length,
                      itemBuilder: (context, index) =>
                          ProductImage(widget.product.images[index], size: size),
                    ),
                    if (widget.product.images.length > 1)
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ),
                    if (widget.product.images.length > 1)
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.product.images.length,
                  (index) => buildDot(index: index),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorDot(fillColor: kTextLightColor, isSelected: true),
                    ColorDot(fillColor: Colors.blue, isSelected: false),
                    ColorDot(fillColor: Colors.red, isSelected: false),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.product.title, style: Theme.of(context).textTheme.headlineMedium)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.isFavorite = !widget.product.isFavorite;
                        });
                      },
                      icon: Icon(widget.product.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                    ),
                  ],
                ),
              ),
              Text("Precio: ${widget.product.price}€", style: TextStyle(fontSize: 24,color: Colors.yellow[800]),
              
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 2),
          child: Text(
            widget.product.description,
            style: Theme.of(context)
                .textTheme
                .bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _selectedImage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _selectedImage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
