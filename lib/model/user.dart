class User {
  String pseudo;
  bool administrator;
  List<String> favorites;

  User(this.pseudo, this.administrator) {
    this.favorites = new List<String>();
  }

  //set favorie quand il y en a dans la bdd
  void setFavorites(List<String> list){
    this.favorites = list;
  }

  //ajout de l'id d'un article en favorie (utilisation de l'objet article ou juste son id)
  void addFavorite(String idArticle){
    this.favorites.add(idArticle);
  }

  void deleteFavorite(String idArticle){
    this.favorites.remove(idArticle);
  }

  void setAdministrator(bool stat){
    this.administrator = stat;
  }
}