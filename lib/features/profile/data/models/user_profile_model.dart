import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.name,
    required super.username,
    required super.bio,
    required super.avatarUrl,
    required super.bannerUrl,
    required super.posts,
    required super.followers,
    required super.following,
    super.isVerified,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String,
      avatarUrl: json['avatarUrl'] as String,
      bannerUrl: json['bannerUrl'] as String,
      posts: json['posts'] as int,
      followers: json['followers'] as int,
      following: json['following'] as int,
      isVerified: json['isVerified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'username': username,
    'bio': bio,
    'avatarUrl': avatarUrl,
    'bannerUrl': bannerUrl,
    'posts': posts,
    'followers': followers,
    'following': following,
    'isVerified': isVerified,
  };
}