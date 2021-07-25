// To parse this JSON data, do
//
//     final discordClass = discordClassFromJson(jsonString);

import 'dart:convert';

DiscordClass discordClassFromJson(String str) => DiscordClass.fromJson(json.decode(str));

String discordClassToJson(DiscordClass data) => json.encode(data.toJson());

class DiscordClass {
    DiscordClass({
        required this.id,
        required this.name,
        required this.instantInvite,
        required this.channels,
        required this.members,
        required this.presenceCount,
    });

    String id;
    String name;
    dynamic instantInvite;
    List<Channel> channels;
    List<Member> members;
    int presenceCount;

    factory DiscordClass.fromJson(Map<String, dynamic> json) => DiscordClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        instantInvite: json["instant_invite"],
        channels: List<Channel>.from(json["channels"].map((x) => Channel.fromJson(x))),
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        presenceCount: json["presence_count"] == null ? null : json["presence_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "instant_invite": instantInvite,
        "channels": channels == null ? null : List<dynamic>.from(channels.map((x) => x.toJson())),
        "members": members == null ? null : List<dynamic>.from(members.map((x) => x.toJson())),
        "presence_count": presenceCount == null ? null : presenceCount,
    };
}

class Channel {
    Channel({
        required this.id,
        required this.name,
        required this.position,
    });

    String id;
    String name;
    int position;

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        position: json["position"] == null ? null : json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "position": position == null ? null : position,
    };
}

class Member {
    Member({
        required this.id,
        required this.username,
        required this.discriminator,
        required this.avatar,
        required this.status,
        required this.avatarUrl,
    });

    String id;
    String username;
    String discriminator;
    dynamic avatar;
    String status;
    String avatarUrl;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        discriminator: json["discriminator"] == null ? null : json["discriminator"],
        avatar: json["avatar"],
        status: json["status"] == null ? null : json["status"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "discriminator": discriminator == null ? null : discriminator,
        "avatar": avatar,
        "status": status == null ? null : status,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
    };
}

class Game {
    Game({
        required this.name,
    });

    String name;

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
    };
}
