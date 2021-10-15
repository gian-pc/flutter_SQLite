class Libro {
  int id;
  String descripcionLibro;
  String autor;
  String urlImage;

  Libro(
      {required this.id,
      required this.descripcionLibro,
      required this.autor,
      required this.urlImage});

  Map<String, dynamic> convertirAMap() {
    return {
      "id": id,
      "descripcionLibro": descripcionLibro,
      "autor": autor,
      "urlImage": urlImage,
    };
  }
}
