class ImageData {
  final int imageId;
  final String createdAt;
  final String locationId;
  final String imageCategoryId;
  final String imagePath;

  ImageData({
    required this.imageId,
    required this.createdAt,
    required this.locationId,
    required this.imageCategoryId,
    required this.imagePath
    }
  );
  get getImageId => imageId;
  get getCreatedAt => createdAt;
  get getLocationId => locationId;
  get getImageCategoryId => imageCategoryId;
  get getImagePath => imagePath;
}
