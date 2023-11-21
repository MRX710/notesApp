class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post({required this.body, required this.author});

  void likePost() {
    userLiked = !userLiked;
    userLiked ? ++likes : --likes;
  }
}
