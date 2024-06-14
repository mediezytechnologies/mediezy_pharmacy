import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  static final storage = GetStorage();

  //* save user token and id
  static saveToken(Map<String, dynamic> user) {
    storage.write('token', user['token']);
    storage.write('id', user['id']);
    storage.write('firstname', user['firstname']);
  }

  //* get user token and id
  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }

  //* remove user token and id
  static removeUserTokenAndUid() {
    storage.remove('id');
    storage.remove("token");
    storage.remove('firstname');
  }
}
