export class ImageUtils {
  static cloudinaryURL(thumbnail = false) {
    let baseURL = "http://res.cloudinary.com/mota/image/fetch/"
    if (thumbnail) {
      baseURL += "w_178,h_100,c_thumb/"
    }

    return baseURL
  }

  static mainImage(s3URL) {
    return ImageUtils.cloudinaryURL()+s3URL;
  }

  static thumbnailImage(s3URL) {
    return ImageUtils.cloudinaryURL(true)+s3URL;
  }
}
