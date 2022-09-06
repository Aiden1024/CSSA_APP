import 'package:utmcssa_app/models/user_profile.dart';

class Post {
  final String title;
  final String description;
  final UserProfile userProfile;
  final int likes;

  Post(this.title, this.description, this.userProfile, this.likes);
}