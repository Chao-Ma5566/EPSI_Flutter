import 'package:epsi_shop/bo/produit.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  final _items = <Produit>[];
  List<Produit> get items => _items;

  void add(Produit produit){
    _items.add(produit);
    notifyListeners();
  }

  void remove(Produit produit){
    _items.remove(produit);
    notifyListeners();
  }

  String getSum(){
    num sum = 0;
    for (Produit item in _items){
        sum += item.prix;
    }
    String sumString = "${sum.toStringAsFixed(2)}€";
    return sumString;
  }

  void removeAll(){
    _items.clear();
    notifyListeners();
  }
}