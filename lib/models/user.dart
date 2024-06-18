class User {
  String id;
  String name;
  int rating;
  int matches;
  int victories;
  int defeats;
  String email;
  double balance;
  String avatar = "assets/images/default-avatar.png";
  String senha;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
    required this.rating,
    required this.victories,
    required this.defeats,
    required this.matches,
    required this.senha,
  });
}
