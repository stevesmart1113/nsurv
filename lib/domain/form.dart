class Form {
  
  final String clientName;
  final String fields;

  Form({
    this.clientName,
    this.fields,
  });

  factory Form.fromJson(Map<String, dynamic> json) {
    return Form(
      clientName: json['client_name'],
      fields: json['fields'].toString()
    );
  }
}
