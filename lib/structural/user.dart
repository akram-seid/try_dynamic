
class User{
  String username;
  String fullName;
  String password;
  bool isApplied;
  bool isActive;

  User(
      this.username,
      this.fullName,
      this.password,
      this.isApplied,
      this.isActive
      );
  static isUserLoggedIn(){
    return true;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["statement"],
    fullName: json["option"],
    password: json["UserOrder"],
    isApplied: json["required"],
    isActive: json["required"],


  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "fullName": fullName,
    "password": password,
    "required": isApplied,
    "isActive": isActive,


  };

}