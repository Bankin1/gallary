import '../models/image_model.dart';

class ImageRepository {
  final List<ImageModel> _images = [
    ImageModel(id: '1', url: 'https://img.freepik.com/free-photo/smiley-woman-talking-phone-medium-shot_23-2149476757.jpg?t=st=1717335652~exp=1717339252~hmac=f549e9669df1997689749f110cc5684fe4ce2fc959a3b5de804b00d6d5123136&w=1380', category: 'Category 1'),
    ImageModel(id: '2', url: 'https://img.freepik.com/free-photo/medium-shot-contemplative-man-seaside_23-2150531618.jpg?t=st=1717338204~exp=1717341804~hmac=1a58c13580abddc514b5982236f19031c884d941f1d7e6690558387f0b448be8&w=1380', category: 'Category 1'),
    ImageModel(id: '3', url: 'https://img.freepik.com/free-photo/psychological-therapy-support-group-meeting_23-2151044467.jpg?t=st=1717338223~exp=1717341823~hmac=4415705a3457fe3dbd762385260379cca86e35829f9b07da541528d275f3c6fb&w=1380', category: 'Category 1'),
    ImageModel(id: '4', url: 'https://img.freepik.com/premium-photo/portrait-cute-baby-girl-lying-home_1048944-16380304.jpg?w=1380', category: 'Category 1'),
    ImageModel(id: '5', url: 'https://img.freepik.com/free-photo/people-carrying-a-burden-concept_23-2150040372.jpg?w=740&t=st=1717338291~exp=1717338891~hmac=a8039134d14b879b8af14afe91bcabb32c23bf9420687cd715da0214c7a8a581', category: 'Category 1'),
    ImageModel(id: '6', url: 'https://img.freepik.com/free-photo/depressed-man-standing-in-the-rain_23-2150761516.jpg?w=1380&t=st=1717338311~exp=1717338911~hmac=25739db1c6c9cb3423803e59d3db451af656ddf3866f9308cccabf49eec7c24e', category: 'Category 1'),
    ImageModel(id: '7', url: 'https://img.freepik.com/premium-photo/full-shot-girl-learning-math-school_23-2150470852.jpg?w=1380', category: 'Category 1'),
    ImageModel(id: '8', url: 'https://img.freepik.com/free-photo/person-near-alternative-energy-plant_23-2149192730.jpg?t=st=1717703961~exp=1717707561~hmac=101e7f3770d28cc4446d5e55692289cf7659ae924e1bdbe3525164ae51f48ee8&w=1380', category: 'Category 1'),
    ImageModel(id: '9', url: 'https://img.freepik.com/premium-photo/woman-decorating-her-home-with-orchids_23-2150960657.jpg?w=1380', category: 'Category 1'),
    ImageModel(id: '10', url: 'https://img.freepik.com/free-photo/flat-lay-desk-arrangement-with-pencils_23-2149009549.jpg?w=740&t=st=1717703932~exp=1717704532~hmac=7c0945bf172cf89fdaa6c200e3ed1e1cc6739dab3335082945b9bf3569d7b7fc', category: 'Category 1'),
  ];

  Future<List<ImageModel>> fetchImages(String category) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return _images.where((image) => image.category == category).toList();
  }
}