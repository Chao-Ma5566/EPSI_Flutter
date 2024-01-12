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
                          Padding(
                            padding: EdgeInsets.only(right: 18.0),
                            child: Icon(Icons.chevron_right),
                          )
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

  String _selectedMethod = "";

  void getPaymentMethod(name) {
    setState(() { _selectedMethod = name; });
  }
  @override
  Widget build(BuildContext context) {


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
                    _selectedMethod == "Apple"? Stack(
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.error),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getPaymentMethod(""),
                              icon: Icon(
                                FontAwesomeIcons.ccApplePay,
                                color: Theme.of(context).colorScheme.error,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ):
                    Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getPaymentMethod("Apple"),
                              icon: Icon(
                                FontAwesomeIcons.ccApplePay,
                                size: 35,
                              ),
                            ),
                          ),
                    ),
                    Spacer(),
                    _selectedMethod == "Visa"? Stack(
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.error),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getPaymentMethod(""),
                              icon: Icon(
                                FontAwesomeIcons.ccVisa,
                                color: Theme.of(context).colorScheme.error,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ):Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> getPaymentMethod("Visa"),
                          icon: Icon(
                            FontAwesomeIcons.ccVisa,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    _selectedMethod == "Master"? Stack(
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.error),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getPaymentMethod(""),
                              icon: Icon(
                                FontAwesomeIcons.ccMastercard,
                                color: Theme.of(context).colorScheme.error,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ):Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> getPaymentMethod("Master"),
                          icon: Icon(
                            FontAwesomeIcons.ccMastercard,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    _selectedMethod == "Paypal"? Stack(
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Theme.of(context).colorScheme.error),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                            child: IconButton(
                              onPressed: ()=> getPaymentMethod(""),
                              icon: Icon(
                                FontAwesomeIcons.ccPaypal,
                                color: Theme.of(context).colorScheme.error,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ):Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 12,top: 12,right:16),
                        child: IconButton(
                          onPressed: ()=> getPaymentMethod("Paypal"),
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
            onPressed: _selectedMethod.isNotEmpty?() {
              final snackBar = SnackBar(
                content: const Text('Votre commande est validée'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }: (){
              final snackBar = SnackBar(
                content: const Text('Il faut choisir une méthode de paiement'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Confirmé la commande'),
          ),
        )
      ],
    );
  }
}
