import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jugos_casablanca/service/shared_pref.dart';
class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Obtener datos del usuario por su correo electrónico
  Future<Map<String, dynamic>?> getUserDataByEmail(String email) async {
    try {
      // Consulta a Firestore para obtener datos del usuario por email
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
          .collection('users')
          .where('Email', isEqualTo: email)
          .limit(1)
          .get();

      // Verifica si se encontró algún documento
      if (querySnapshot.docs.isNotEmpty) {

        var userData = querySnapshot.docs.first.data();
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Método para obtener el nombre del usuario por su correo electrónico
  Future<String?> getUserNameByEmail(String email) async {
    var userData = await getUserDataByEmail(email);
    if (userData != null) {
      return userData['Name'];
    } else {
      return null;
    }
  }

  // Método para obtener el wallet del usuario por su correo electrónico
  Future<String?> getUserWalletByEmail(String email) async {
    var userData = await getUserDataByEmail(email);
    if (userData != null) {
      return userData['Wallet'];
    } else {
      return null;
    }
  }

  // Método para obtener el ID del usuario por su correo electrónico
  Future<String?> getUserIdByEmail(String email) async {
    var userData = await getUserDataByEmail(email);
    if (userData != null) {
      return userData['Id'];
    } else {
      return null;
    }
  }

  // Método para obtener y guardar todos los datos del usuario en Shared Preferences
  Future<void> getUserDataAndSaveToPrefs(String email) async {
    try {
      var userData = await getUserDataByEmail(email);
      if (userData != null) {
        // Guarda los datos en Shared Preferences
        await SharedPreferenceHelper().saveUserName(userData['Name']);
        await SharedPreferenceHelper().saveUserWallet(userData['Wallet']);
        await SharedPreferenceHelper().saveUserId(userData['Id']);
      }
    } catch (e) {
      print('Error al obtener y guardar datos del usuario en Shared Preferences: $e');
    }
  }
}
