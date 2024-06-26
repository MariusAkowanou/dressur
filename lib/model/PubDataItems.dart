class PubData{
  final String description;
  final String imagePath; 

  PubData({required this.description,required this.imagePath});
}

class PubDataItem{
  final List<PubData> items = [
    PubData(
      imagePath: 'images/img6.jpg', 
      description: 'ceci est la description 1'
    ),
     PubData(
      imagePath: 'images/img6.jpg', 
      description: 'ceci est la description 2'
    ),
  ];

}