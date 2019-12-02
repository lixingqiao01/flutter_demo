
class User {
  factory User() => _getInstance();
  static User get instance => _getInstance();
  static User _instance;
  User._internal();

  static User _getInstance(){
    if (_instance == null) {
      _instance = new User._internal();
    }
    return _instance;
  }

  int user_id;
  String username;
  String name;
  int gender;
  int gmt_create;
  int gmt_modified;
  String password;

  User formatJson(Map<String,dynamic> json) {
    User user = User();
    user.name = json["name"];
    user.username = json["username"];
    user.user_id = json["user_id"];
    user.gender = json["gender"];
    user.gmt_create = json["gmt_create"];
    user.gmt_modified = json["gmt_modified"];
    user.password = json["password"];
    return user;
  }

//  User.fromJson(Map<String,dynamic> json):
//        name = json["name"],
//        username = json["username"],
//        user_id = json["user_id"],
//        gender = json["gender"],
//        gmt_create = json["gmt_create"],
//        gmt_modified = json["gmt_modified"],
//        password = json["password"];
}