import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../bo/ImageSection.dart';
import '../bo/cart.dart';
import '../bo/produit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Center(child: Text("EPSI Shop")),
            ),
          actions: [
            Badge(
              offset: Offset(-10, 8),
              label: Text('${context.watch<Cart>().items.length}'),
              child: IconButton(
                onPressed: ()=> context.go('/cart'),
                icon: Icon(Icons.add_shopping_cart),
              ),
            ),
            IconButton(
                onPressed: ()=> context.go("/about-us"),
                icon: Icon(Icons.info_outline)
            )
          ]
        ),
        body: FutureBuilder<List<Produit>>(
            future: fetchListArticles(),
            builder: (context,snapshot)=>
            snapshot.hasData?
            ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index)=> ListTile(
                    onTap: ()=>context.go("/detail", extra:snapshot.data![index]),
                    leading: ImageSection(
                      image: snapshot.data![index].image,
                    ),
                    title: Text("${snapshot.data![index].nom}"),
                    subtitle: Text(
                      snapshot.data![index].getPrixEuro(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),

                    trailing: TextButton(
                      child: const Text("Ajouter"),
                      onPressed: () => context.read<Cart>()
                          .add(snapshot.data![index]),
                    )
                )
            ):Icon(Icons.error)
        )
    );
  }

  Future<List<Produit>> fetchListArticles() async{
    final response = await get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200 && response.body.isNotEmpty){
      final listMapProduits = jsonDecode(response.body) as List<dynamic>;
      final listProduit = <Produit>[];
      for(Map<String, dynamic> map in listMapProduits){
        listProduit.add(Produit.fromMap(map));
      }
      return listProduit;
    }else{
      throw Exception("Erreur lors de la réception des produits");
    }
  }
}

