import 'dart:convert';

class User {
  final String id;
  final String name;
  final String phone;
  final String? avatar;
  final bool isOnline;
  final DateTime lastSeen;
  final String? bio;
  final String? status;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;
  final List<String>? tags;
  final String? email;
  final String? username;
  final bool? hasUnreadMessages;
  final int? unreadCount;
  final String? themePreference;
  final bool? notificationsEnabled;
  final String? languageCode;
  final String? timezone;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    this.avatar,
    required this.isOnline,
    required this.lastSeen,
    this.bio,
    this.status,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.metadata,
    this.tags,
    this.email,
    this.username,
    this.hasUnreadMessages,
    this.unreadCount,
    this.themePreference,
    this.notificationsEnabled,
    this.languageCode,
    this.timezone,
  });

  // Factory constructor for creating User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      avatar: json['avatar'] as String?,
      isOnline: json['isOnline'] as bool? ?? false,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      bio: json['bio'] as String?,
      status: json['status'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      metadata: json['metadata'] != null
          ? Map<String, dynamic>.from(json['metadata'] as Map)
          : null,
      tags: json['tags'] != null
          ? List<String>.from(json['tags'] as List)
          : null,
      email: json['email'] as String?,
      username: json['username'] as String?,
      hasUnreadMessages: json['hasUnreadMessages'] as bool?,
      unreadCount: json['unreadCount'] as int?,
      themePreference: json['themePreference'] as String?,
      notificationsEnabled: json['notificationsEnabled'] as bool?,
      languageCode: json['languageCode'] as String?,
      timezone: json['timezone'] as String?,
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'isOnline': isOnline,
      'lastSeen': lastSeen.toIso8601String(),
      'bio': bio,
      'status': status,
      'isVerified': isVerified,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'metadata': metadata,
      'tags': tags,
      'email': email,
      'username': username,
      'hasUnreadMessages': hasUnreadMessages,
      'unreadCount': unreadCount,
      'themePreference': themePreference,
      'notificationsEnabled': notificationsEnabled,
      'languageCode': languageCode,
      'timezone': timezone,
    };
  }

  // Copy with method for immutability
  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? avatar,
    bool? isOnline,
    DateTime? lastSeen,
    String? bio,
    String? status,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
    List<String>? tags,
    String? email,
    String? username,
    bool? hasUnreadMessages,
    int? unreadCount,
    String? themePreference,
    bool? notificationsEnabled,
    String? languageCode,
    String? timezone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      bio: bio ?? this.bio,
      status: status ?? this.status,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
      tags: tags ?? this.tags,
      email: email ?? this.email,
      username: username ?? this.username,
      hasUnreadMessages: hasUnreadMessages ?? this.hasUnreadMessages,
      unreadCount: unreadCount ?? this.unreadCount,
      themePreference: themePreference ?? this.themePreference,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      languageCode: languageCode ?? this.languageCode,
      timezone: timezone ?? this.timezone,
    );
  }

  // Equality check
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ phone.hashCode ^ avatar.hashCode;
  }

  // Helper methods
  String get displayName => name.isNotEmpty ? name : phone;
  
  String get initials {
    if (name.isNotEmpty) {
      final parts = name.split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return name.substring(0, 2).toUpperCase();
    }
    return phone.substring(phone.length - 2).toUpperCase();
  }
  
  bool get hasAvatar => avatar != null && avatar!.isNotEmpty;
  
  String get onlineStatus {
    if (isOnline) return 'Online';
    final now = DateTime.now();
    final diff = now.difference(lastSeen);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
  
  String toJsonString() => json.encode(toJson());
  
  factory User.fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString) as Map<String, dynamic>);
  }
  
  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  static List<Map<String, dynamic>> toJsonList(List<User> users) {
    return users.map((user) => user.toJson()).toList();
  }
  
  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, isOnline: $isOnline)';
  }
  
  // Mock user for testing
  static User get mockUser {
    return User(
      id: '1',
      name: 'John Doe',
      phone: '+1234567890',
      avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      isOnline: true,
      lastSeen: DateTime.now(),
      bio: 'Flutter developer & designer',
      status: 'Coding something awesome!',
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now(),
      tags: ['developer', 'designer', 'flutter'],
      email: 'john@example.com',
      username: 'johndoe',
      themePreference: 'dark',
      notificationsEnabled: true,
      languageCode: 'en',
      timezone: 'UTC',
    );
  }
  
  // List of mock users
  static List<User> get mockUsers {
    return [
      mockUser,
      User(
        id: '2',
        name: 'Jane Smith',
        phone: '+1987654321',
        avatar: 'https://randomuser.me/api/portraits/women/2.jpg',
        isOnline: true,
        lastSeen: DateTime.now(),
        bio: 'Product Manager',
        status: 'In a meeting',
        isVerified: true,
      ),
      User(
        id: '3',
        name: 'Alex Johnson',
        phone: '+1122334455',
        avatar: 'https://randomuser.me/api/portraits/men/3.jpg',
        isOnline: false,
        lastSeen: DateTime.now().subtract(const Duration(hours: 2)),
        bio: 'Backend Developer',
        status: 'AFK',
        isVerified: false,
      ),
    ];
  }
}
