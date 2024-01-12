import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bo/ImageSection.dart';
import '../bo/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text(title)),
        ),
      ),
      body: context.watch<Cart>().items.length > 0
          ? ListCart():EmptyCart()
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Votre panier total est de"),
              Text(
                "0.00€",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('Votre panier est actuellement vide'),
          Icon(Icons.add_photo_alternate),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

class ListCart extends StatelessWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Votre panier total est de"),
                  Text(
                    cart.getSum(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: cart.items.length,
                  itemBuilder: (context, index)=> ListTile(
                      leading: ImageSection(
                        image: cart.items[index].image,
                      ),
                      title: Text("${cart.items[index].nom}"),
                      subtitle: Text(
                        cart.items[index].getPrixEuro(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),

                      trailing: TextButton(
                        child: Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5, left:10, right:10),
                            child: Text(
                                "X",
                            ),
                          ),
                        ),
                        onPressed: () => context.read<Cart>()
                            .remove(cart.items[index]),
                      )
                  )
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                onPressed: () => context.go('/payment'),
                child: Text(' Procéder au paiment'),
              ),
            )
          ],
        );
      }
    );
  }
}
