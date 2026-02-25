class Product {

  final int id,price;
  final String title, subTitle, description;
  final List<String> images;
  bool isFavorite;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.images,
    this.isFavorite = false,
  });
}
  List<Product> products = [
  Product(
    id: 1,
    price: 49,
    title: "Airpods",
    subTitle: "Alta calidad de sonido",
    images: ["images/airpod.png"],
    description:
        "Los AirPods ofrecen un sonido claro y equilibrado, con un diseño inalámbrico cómodo y ligero."
  ),
  Product(
    id: 2,
    price: 270,
    title: "Móvil",
    subTitle: " Redmi note 11 Pro ",
    images: ["images/mobile.png", "images/mobile.png"],
    description:
        "El Redmi Note 11 Pro destaca por su pantalla AMOLED de 120 Hz, su potente cámara de 108 MP y una batería de larga duración con carga rápida. "
  ),
  Product(
    id: 3,
    price: 499,
    title: "HP Laptop",
    subTitle: "Con Exhibición De Alta Resolución",
    images: ["images/laptop.png","images/pc.webp", "images/pc2.webp", "images/pc3.webp","images/pc4.webp","images/pc5.webp"],
    description:
    "HP Lite AMD Ryzen 7 Laptop (16GB, 512GB SSD, Windows 11, 15.6 inch Full HD Display, MS Office, Steel Gray, 1.59 KG)"
  ),
  Product(
    id: 4,
    price: 45,
    title: "Auriculares",
    subTitle: "Para largas horas de escucha",
    images: ["images/headset.png"],
    description:
    "Los auriculares ofrecen un sonido nítido y equilibrado, ideales para escuchar música, ver vídeos o realizar llamadas con comodidad. "
  ),
  Product(
    id: 5,
    price: 26,
    title: "Grabadora de voz",
    subTitle: "Registra los momentos importantes que te rodean",
    images: ["images/speaker.png"],
    description:
    "La grabadora de voz ofrece una captura de audio clara y nítida, ideal para entrevistas, reuniones, clases o notas personales."
  ),
  Product(
    id: 6,
    price: 239,
    title: "Cámaras de computadora",
    subTitle: "Alta calidad de imagen y resolución",
    images: ["images/camera.png"],
    description:
    "Las cámaras de computadora ofrecen una imagen clara y fluida, ideal para videollamadas, clases en línea y reuniones de trabajo."
  ),
  Product(
    id: 7,
    price: 39,
    title: "Gafas 3D",
    subTitle: "Para llevarte al mundo virtual",
    images: ["images/class.png"],
    description:
    "Las gafas 3D permiten disfrutar de una experiencia visual inmersiva, ofreciendo profundidad y realismo en películas, juegos y contenido multimedia."
  ),
  
];
