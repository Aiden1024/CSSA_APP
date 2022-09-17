import 'package:utmcssa_app/models/user_profile.dart';

class Post {
  final String title;
  final String subtitle;
  final String mainText;
  final UserProfile userProfile;
  final int likes;
  final String date;
  final String pic;

  Post( {required this.title, required this.mainText, required this.userProfile, required this.likes, required this.date, required this.pic, required this.subtitle});
}