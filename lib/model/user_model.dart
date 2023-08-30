class UserModel {
  String name;
  String email;
  String number;
  int age;
  double height;
  double weight;
  String sex;

  UserModel({
    required this.name,
    required this.email,
    required this.number,
    required this.age,
    required this.height,
    required this.weight,
    required this.sex,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'number': number,
      'age': age,
      'height': height,
      'weight': weight,
      'sex': sex,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      number: map['number'],
      age: map['age'],
      height: map['height'],
      weight: map['weight'],
      sex: map['sex'],
    );
  }
}
