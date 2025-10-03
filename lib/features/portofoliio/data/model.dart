class PortofolioModel {
  final String title;
  final String description;
  final String createdBy;
  final String grade;
  final String imagePath;

  PortofolioModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.createdBy,
    required this.grade,
  });
}

// dummy data
List<PortofolioModel> dummyPortofolio = [
  for (int i = 1; i <= 5; i++)
    PortofolioModel(
      title: 'Kemampuan Merangkum Tulisan',
      description: 'BAHASA SUNDA',
      imagePath: 'assets/images/image-$i.jpg',
      createdBy: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
];
