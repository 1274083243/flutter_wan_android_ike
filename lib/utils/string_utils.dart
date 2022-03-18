class StringUtils {
  /// 包裹Assets路径
  static String wrapperAssets(String fileName) {
    if (fileName.isEmpty) {
      return "";
    }
    return "assets/image/$fileName";
  }
}
