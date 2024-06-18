import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../auth/auth.dart';
import '../repositories/user_repository.dart';
import 'package:chesstip/models/match.dart';

class DBFirestore {
  DBFirestore._();

  static final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }

  static create_new_user(String username) {
    final db = DBFirestore.get();

    db.collection("users").doc(Auth().currentUser!.uid).set({
      'username': username,
      'balance': 100,
      'victories': 0,
      'defeats': 0,
      'matches': 0,
      'rating': 400,
    });

    UserRepository().update(
      username,
      Auth().currentUser?.email,
      Auth().currentUser!.uid,
      100,
      0,
      0,
      0,
      400,
    );
  }

  static load_user_from_id() async {
    final db = DBFirestore.get();

    final user_info = await db.collection("users").doc(Auth().currentUser!.uid).get();

    UserRepository().update(
      user_info["username"],
      Auth().currentUser?.email,
      Auth().currentUser!.uid,
      (user_info["balance"] as int).toDouble(),
      user_info["matches"],
      user_info["victories"],
      user_info["defeats"],
      user_info["rating"],
    );
  }

  static send_match_result(Match match) async{
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('dd/MM/yy/HH:mm').format(now);

    final db = DBFirestore.get();

    db.collection("users").doc(Auth().currentUser!.uid).collection("matches").add({
      'datetime': formattedDateTime,
      'whitPlayerID': match.whitePlayer.id,
      'blackPlayerID': match.blackPlayer.id,
      'winnerID': match.winnerId,
      'value': match.value,
    });
  }

  static update_user_balance(double balance) {

    final db = DBFirestore.get();

    final userDocRef = db.collection("users").doc(Auth().currentUser!.uid);

    userDocRef.update({
      'balance': balance,
    });
  }

}
