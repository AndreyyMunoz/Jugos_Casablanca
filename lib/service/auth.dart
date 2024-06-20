import 'package:firebase_auth/firebase_auth.dart';

import 'shared_pref.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final SharedPreferenceHelper sharedPrefs = SharedPreferenceHelper();

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> SignOut() async {
    await auth.signOut();
    // Limpiar SharedPreferences al cerrar sesión
    await sharedPrefs.clearPreferences();
  }

  Future<void> deleteuser() async {
    User? user = auth.currentUser;
    if (user != null) {
      await user.delete();
      // Limpiar SharedPreferences al borrar la cuenta
      await sharedPrefs.clearPreferences();
    } else {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No user currently signed in.',
      );
    }
  }
}
