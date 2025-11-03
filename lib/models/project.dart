class PortfolioProject {
  final String title;
  final String? link;
  final String description;
  final List<String> tech;

  PortfolioProject({
    required this.title,
    required this.description,
    required this.tech,
    this.link,
  });
}
