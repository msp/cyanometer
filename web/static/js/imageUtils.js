export class ImageUtils {
  static cloudinaryURL(thumbnail = false) {
    let baseURL = "https://res.cloudinary.com/mota/image/fetch/"
    if (thumbnail) {
      baseURL += "w_178,h_100,c_thumb/"
    } else {
      baseURL += "w_1200,h_675,ar_16:9/"
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
