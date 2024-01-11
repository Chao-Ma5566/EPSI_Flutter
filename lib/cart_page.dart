import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bo/ImageSection.dart';
import 'bo/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.title});

  final String title;

  @override
  State<CartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text(widget.title)),
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
                        child: const Card(
                          color: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5, left:10, right:10),
                            child: Text(
                                "X",
                                style: TextStyle(
                                      color: Colors.white
                                )
                            ),
                          ),
                        ),
                        onPressed: () => context.read<Cart>()
                            .remove(cart.items[index]),
                      )
                  )
                  ),
            ),
          ],
        );
      }
    );
  }
}
