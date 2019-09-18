class Info {
  final String seed;
  final int result;
  final int page;
  final String version;

  Info({
    this.seed,
    this.result,
    this.page,
    this.version
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return new Info(
      seed: json['seed'],
      result: json['result'],
      page: json['page'],
      version: json['version']
    );
  }
}