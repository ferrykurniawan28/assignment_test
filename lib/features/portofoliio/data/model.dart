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
  PortofolioModel(
    title: 'Kemampuan Merangkum Tulisan',
    description: 'BAHASA SUNDA',
    imagePath: 'assets/images/image-1.jpg',
    createdBy: 'Alice Johnson',
    grade: 'A',
  ),
  PortofolioModel(
    title: 'Analisis Teks Sastra',
    description: 'BAHASA INDONESIA',
    imagePath: 'assets/images/image-2.jpg',
    createdBy: 'Bob Smith',
    grade: 'B+',
  ),
  PortofolioModel(
    title: 'Eksperimen Fisika',
    description: 'FISIKA',
    imagePath: 'assets/images/image-3.jpg',
    createdBy: 'Carol Brown',
    grade: 'A-',
  ),
  PortofolioModel(
    title: 'Penelitian Sejarah',
    description: 'SEJARAH',
    imagePath: 'assets/images/image-4.jpg',
    createdBy: 'David Wilson',
    grade: 'B',
  ),
  PortofolioModel(
    title: 'Karya Seni Rupa',
    description: 'SENI BUDAYA',
    imagePath: 'assets/images/image-5.jpg',
    createdBy: 'Emma Davis',
    grade: 'A+',
  ),
];
