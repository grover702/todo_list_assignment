class UserDataModel {
  String? todoItemName;

  String? todoItemDateTime;
  int? key;

  UserDataModel({
    this.todoItemName,
    this.todoItemDateTime,
    this.key,
  });

  setTodoItemName(String todoItem) {
    this.todoItemName = todoItem;
  }

  setTodoItemDateTime(String dateTime) {
    this.todoItemDateTime = dateTime;
  }

  setKey(int keyValue) {
    this.key = keyValue;
  }

  static Map<String, dynamic> toMap(UserDataModel user) => {
        'todoItemName': user.todoItemName,
        'todoItemDateTime': user.todoItemDateTime,
        'key': user.key,
      };

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
      todoItemName: jsonData['todoItemName'],
      todoItemDateTime: jsonData['todoItemDateTime'],
      key: jsonData['key'],
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserDataModel && o.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
