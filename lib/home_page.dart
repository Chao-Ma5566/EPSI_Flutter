import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'bo/ImageSection.dart';
import 'bo/cart.dart';
import 'bo/produit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  final String title;
  final listProduit = [
    Produit(nom: "WAG écran 34'", description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.", image: "https://th.bing.com/th/id/R.02b6f4d1cf2a4278a571455eb5368084?rik=bBW4mDcx3O1lGg&pid=ImgRaw&r=0", prix: 360, categorie: "categorieA"),
    Produit(nom: "HP écran 36'", description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.", image: "https://th.bing.com/th/id/R.752cb0b91cd8938e02ab6b349823baa5?rik=pRdHrO9muoy2PQ&riu=http%3a%2f%2fstore.hp.com%2fFranceStore%2fHtml%2fMerch%2fImages%2fc05033516_1750x1285.jpg&ehk=OiT7VoZp4nfeiLg3MSbRTfvR7BDkllIfm7sOAGGjsbo%3d&risl=&pid=ImgRaw&r=0", prix: 500, categorie: "low-cost"),
    Produit(nom: "LG écran 32'", description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.", image: "https://www.cw-mobile.de/media/catalog/product/h/e/hewlett-packard_22kd_54_61_cm_21_5_zoll_led-monitor3.jpg", prix: 100, categorie: "low-cost"),
    Produit(nom: "ASUS Zenscreen", description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.", image: "https://m.media-amazon.com/images/I/61H1m5DsFUL._AC_SX425_.jpg", prix: 215, categorie: "low-cost"),
    Produit(nom: "COOLHOOD", description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.", image: "https://m.media-amazon.com/images/I/719q6Mr-lkL._AC_SX425_.jpg", prix: 89, categorie: "low-cost"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Center(child: Text("E-commerce EPSI")),
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

