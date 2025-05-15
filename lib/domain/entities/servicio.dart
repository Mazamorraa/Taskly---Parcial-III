class Servicio {
    int id;
    String nombre;
    String descripcion;
    int precio;

    Servicio({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.precio,
    });

    factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
    };
}
