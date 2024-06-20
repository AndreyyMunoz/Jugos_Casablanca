class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.title, required this.image});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'Descubre la frescura y el sabor de nuestros jugos y comidas favoritas con nuestra app de delivery.',
      title: '¡BIENVENIDO!',
      image: 'assets/images/imgInicio_1.png'),
  UnboardingContent(
      description: 'Entregas inmediatas con nuestros repartidores. Obten tus productos con garatntía de la casa.',
      title: 'SERVICIO A DOMICILO',
      image: 'assets/images/imgInicio_2.png'),
  UnboardingContent(
      description: '¡Explora nuestro menú, haz tu pedido y déjanos sorprenderte con cada entrega! ',
      title: '¡Haz tu pedido y disfruta!',
      image: 'assets/images/imgInicio_3.png'),
];
