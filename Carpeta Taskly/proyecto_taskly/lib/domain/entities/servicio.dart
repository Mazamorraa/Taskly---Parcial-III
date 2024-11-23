class Servicio {
    int id;
    String nombre;
    String descripcion;
    int precio;
    String tipoServicio;

    Servicio({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.precio,
        required this.tipoServicio,
    });

    factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        tipoServicio: json["tipoServicio"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "tipoServicio": tipoServicio,
    };
}
