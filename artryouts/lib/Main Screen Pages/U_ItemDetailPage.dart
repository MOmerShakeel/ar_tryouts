import 'package:flutter/material.dart';
import 'package:artryouts/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
import 'package:artryouts/Models/cart_provider.dart';
import 'package:artryouts/Models/item_model.dart';
import 'package:artryouts/Models/total_provider.dart';
import 'package:artryouts/product_ar.dart';
import 'package:artryouts/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({required this.product, Key? key}) : super(key: key);
  final Item product;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: const MyAppBar(implyLeading: true),
      body: Center(
        child: Stack(children: <Widget>[
          BackDrop(product: product),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.35),
                Positioned(
                  top: screenHeight * 0.35,
                  left: 0,
                  child: ProductDrawer(product: product),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class BackDrop extends StatelessWidget {
  const BackDrop({required this.product, Key? key}) : super(key: key);
  final Item product;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Image.network(product.image),
      width: double.infinity,
      height: screenHeight * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(product.image), fit: BoxFit.cover),
      ),
    );
  }
}

class ProductDrawer extends StatelessWidget {
  const ProductDrawer({required this.product, Key? key}) : super(key: key);
  final Item product;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    Widget addToCartButon() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(screenHeight * 0.25, screenHeight * 0.07),
          primary: Colors.teal,
          onPrimary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.grey.shade900,
        ),
        onPressed: () {
          context.read<CartProvider>().addToCart(product);
          context.read<TotalProvider>().add(product.price);
          context.read<CartProvider>().incCount(product);
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.add_shopping_cart),
            const SizedBox(width: 10),
            Text("Add to Cart",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        // Define size
        height: screenHeight,
        // Add radius
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand Name
              Text(product.name,
                  style: GoogleFonts.poppins(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.start),
              // Product Name And AR Camera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.description,
                      style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  product.ar_link != null
                      ? ArCamButton(product: product)
                      : Container(),
                ],
              ),
              // Product Price
              Text(product.price.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center),
              SizedBox(height: screenHeight * 0.02),
              // Product Description
              Text('RB3200-01',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center),
              // Color Selector from Filter
              // Size Selector from Filter
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // coolButton(
                  //   text: 'ADD TO CART',
                  //   functionToComply: () {
                  //     // Add in the cart

                  //     context.read<CartProvider>().addToCart(product);
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                  addToCartButon(),
                  FavIcon(item: product),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArCamButton extends StatelessWidget {
  const ArCamButton({required this.product, Key? key}) : super(key: key);
  final Item product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.camera),
      iconSize: MediaQuery.of(context).size.height * 0.05,
      color: Colors.green,
      onPressed: () {
        // Navigate to the AR Camera
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FaceProductAR(link: product.ar_link!)));
      },
    );
  }
}
