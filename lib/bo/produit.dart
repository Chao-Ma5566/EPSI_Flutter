class Produit{
  String nom;
  String description;
  String image;
  num prix;
  String categorie;

  Produit({
    required this.nom,
    required this.description,
    required this.image,
    required this.prix,
    required this.categorie,
  });

  String getPrixEuro() => "$prix€";

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'description': this.description,
      'image': this.image,
      'prix': this.prix,
      'categorie': this.categorie,
    };
  }

  factory Produit.fromMap(Map<String, dynamic> map) {
    return Produit(
      nom: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      prix: map['price'] as num,
      categorie: map['category'] as String,
    );
  }
}
