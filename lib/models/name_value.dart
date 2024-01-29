
enum NameValueType {
  param,
  header
}

class NameValue {
  String name;
  String value;
  bool active;

  NameValue({required this.name, required this.value, this.active = true});

}



extension NameValueTypeText on NameValueType {
  String hintName() {
    if (this == NameValueType.param) {
      return 'Param Name';
    } else if (this == NameValueType.header) {
      return 'Header Name';
    }
    return 'Name';
  }

  String hintValue() {
    if (this == NameValueType.param) {
      return 'Param Value';
    } else if (this == NameValueType.header) {
      return 'Header Value';
    }
    return 'Name';
  }
}

