import 'package:epsi_shop/bo/ImageSection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';
import '../bo/produit.dart';

class DetailPage extends StatelessWidget {
  final Produit produit;
  const DetailPage({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text("${produit.nom}")),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:18.0,right: 18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 15),
              child: Center(child: ImageProduit(image: produit.image)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 8.0),
              child: Text(
                "${produit.nom}",
                style: TextStyle(height: 1, fontSize: 25),
              ),
            ),
            Row(
              children: [
                Text(
                  "${produit.categorie}",
                  style: TextStyle(height: 1, fontSize: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.end,
              children: [
                Text(
                  produit.getPrixEuro(),
                  style: TextStyle(height: 3,fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("${produit.description}"),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => context.read<Cart>()
              .add(produit),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Text(' Ajouter au panier'),
            ],
          ),
        ),
      ),
    );
  }
}
