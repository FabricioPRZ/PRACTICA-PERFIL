class UserProfile {
  const UserProfile({
    required this.name,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    required this.bannerUrl,
    required this.posts,
    required this.followers,
    required this.following,
    this.isVerified = false,
  });

  final String name;
  final String username;
  final String bio;
  final String avatarUrl;
  final String bannerUrl;
  final int posts;
  final int followers;
  final int following;
  final bool isVerified;
}