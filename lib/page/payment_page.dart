import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text(
              "Finalisation de la commande",
              style: TextStyle(
                  fontSize: 16
              )
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PaymentDetail(),
      )
    );
  }
}

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        children: [
                          Text(
                              "Récupitatif de votre commande",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sous-Total"),
                          Text(
                            cart.getSum(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Vous économisez",
                              style: TextStyle(color: Theme.of(context).colorScheme.surfaceTint),
                          ),
                          Text(
                            "-0.01€",
                            style: TextStyle(color: Theme.of(context).colorScheme.surfaceTint),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("TVA"),
                          Text(
                            cart.getTVA(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "TOTAL",
                              style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            cart.getTotal(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Adresse de livraison",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                Text(
                                  "Michel Le Poney",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              children: [
                                Text("8 rue des ouvertures des portes"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              children: [
                                Text("93204 CORBEAX"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.chevron_right)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              MethodPayment(),
              ],
          );
        }
    );
  }
}

class MethodPayment extends StatefulWidget {
  const MethodPayment({super.key});

  @override
  State<MethodPayment> createState() => _MethodPaymentState();
}

class _MethodPaymentState extends State<MethodPayment> {
  @override
  Widget build(BuildContext context) {
    String selectedMethod = "";

    void getApple() {
      setState(() { selectedMethod = "Apple"; });
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.0, bottom: 35),
          child: Column(
            children: [
              Text(
                "Méthode de paiement",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    selectedMethod.isNotEmpty?Text("$selectedMethod"):Text(""),
                    selectedMethod == "Apple"? Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.red),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> selectedMethod = "",
                          icon: Icon(
                            FontAwesomeIcons.ccAmazonPay,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ),
                    ):
                    Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getApple(),
                              icon: Icon(
                                FontAwesomeIcons.ccApplePay,
                                size: 35,
                              ),
                            ),
                          ),
                    ),
                    Spacer(),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> selectedMethod = "Visa",
                          icon: Icon(
                            FontAwesomeIcons.ccVisa,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> selectedMethod = "Master",
                          icon: Icon(
                            FontAwesomeIcons.ccMastercard,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> selectedMethod = "Paypal",
                          icon: Icon(
                            FontAwesomeIcons.ccPaypal,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          "En cliquant sur Confirmer l’achat , vous acceptez les Conditions de vente de EPSI Shop International. Besoin d’aide ? Désolé on peut rien faire.\nEn poursuivant, vous acceptez les Conditions d’utilisation du fournisseur de paiement CoffeDis.",
          style: TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5.0),
          child: ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Votre commande est validée'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Confirmé la commande'),
          ),
        )
      ],
    );
  }
}
