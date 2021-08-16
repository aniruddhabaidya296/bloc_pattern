class University {
  String country;
  String alphaTwoCode;
  String name;
  List<dynamic> domains;
  void createUniversity(
      String country, String alphaTwoCode, String name, List<dynamic> domains) {
    this.country = country;
    this.alphaTwoCode = alphaTwoCode;
    this.name = name;
    this.domains = domains;
  }

  void dispose() {
    this.country = '';
    this.alphaTwoCode = '';
    this.name = '';
    this.domains = [''];
  }

  Map<String, dynamic> toJson() => {
        'Country': country,
        'Code': alphaTwoCode,
        'Name': name,
        'Domain': domains
      };
}
