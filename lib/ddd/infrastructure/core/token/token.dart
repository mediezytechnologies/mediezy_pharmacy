import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  static final storage = GetStorage();

//save=====================
  static saveToken(Map<String, dynamic> user) {
    storage.write("token", user['token']);
    storage.write('id', user['id']);
  }

  //Get_User_Details=====================
  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }

  removed(String key) {}

  //<<<<<Remove_User_Details>>>>>//
  removeUserTokenAndUid() {
    storage.remove("id");
    storage.remove("token");
  }
}
