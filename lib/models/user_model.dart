
class UserModel {
  String id;
  String name;
  String lastName;
  String slug;
  String email;
  String username;
  String accessCode;
  bool isRoot;
  bool isAdmin;
  bool isOperator;
  bool isActive;
  String fullName;

  UserModel(
      {this.id,
      this.name,
      this.lastName,
      this.slug,
      this.email,
      this.username,
      this.accessCode,
      this.isRoot,
      this.isAdmin,
      this.isOperator,
      this.isActive,
      this.fullName}
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    slug = json['slug'];
    email = json['email'];
    username = json['username'];
    accessCode = json['access_code'];
    isRoot = json['is_root'];
    isAdmin = json['is_admin'];
    isOperator = json['is_operator'];
    isActive = json['is_active'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['username'] = this.username;
    data['access_code'] = this.accessCode;
    data['is_root'] = this.isRoot;
    data['is_admin'] = this.isAdmin;
    data['is_operator'] = this.isOperator;
    data['is_active'] = this.isActive;
    data['full_name'] = this.fullName;
    return data;
  }

  @override
  String toString() {
    return "UserModel: (id: $id, nome: $fullName, email: $email)";
  }
}
