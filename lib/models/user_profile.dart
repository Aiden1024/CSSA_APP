class UserProfile {
  final String username;
  final String formalName;
  final Future<String> pic;
  final String bio;
  final List<String> post;
  final List<int> departments;
  final String uid;

  UserProfile({required this.username, required this.formalName, required this.pic, required this.bio, required this.post, required this.departments, required this.uid});

}