class Comment {
  final String id;
  final String text;
  final String username;
  final String userProfilePic;
  final String postId;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.text,
    required this.username,
    required this.userProfilePic,
    required this.postId,
    required this.createdAt,
  });

  Comment copyWith({
    String? id,
    String? text,
    String? username,
    String? userProfilePic,
    String? postId,
    DateTime? createdAt,
  }) {
    return Comment(
      id: id ?? this.id,
      text: text ?? this.text,
      username: username ?? this.username,
      userProfilePic: userProfilePic ?? this.userProfilePic,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'username': username,
      'userProfilePic': userProfilePic,
      'postId': postId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as String,
      text: map['text'] as String,
      username: map['username'] as String,
      userProfilePic: map['userProfilePic'] as String,
      postId: map['postId'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, username: $username, userProfilePic: $userProfilePic, postId: $postId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.username == username &&
        other.userProfilePic == userProfilePic &&
        other.postId == postId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        username.hashCode ^
        userProfilePic.hashCode ^
        postId.hashCode ^
        createdAt.hashCode;
  }
}
