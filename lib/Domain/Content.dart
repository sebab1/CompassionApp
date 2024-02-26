class Content {
  String? content;
  String? link;

  Content(this.content, this.link);

  @override
  String toString() {
    return '{content: $content, link: $link}';
  }
}
