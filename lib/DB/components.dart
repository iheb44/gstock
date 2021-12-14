final String componentsTable = 'components';

class componentsField {
  static final List<String> values = [id, type, name, date, quntity];
  static final String id = '_id';
  static final String type = "id_com";
  static final String name = 'name';
  static final String date = 'date';
  static final String quntity = "quntity";
}

class components {
  final int? id;
  final String type;
  final String name;
  final String date;
  final String quntity;

  const components(
      {this.id,
      required this.type,
      required this.name,
      required this.date,
      required this.quntity});
  static components fromJsonct(Map<String, Object?> json) => components(
        id: json[componentsField.id] as int?,
        type: json[componentsField.type] as String,
        name: json[componentsField.name] as String,
        date: json[componentsField.date] as String,
        quntity: json[componentsField.quntity] as String,
      );

  Map<String, Object?> toJsonc() => {
        componentsField.id: id,
        componentsField.type: type,
        componentsField.name: name,
        componentsField.date: date,
        componentsField.quntity: quntity,
      };
  components copyc({int? id}) => components(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        date: date ?? this.date,
        quntity: quntity ?? this.quntity,
      );

}
