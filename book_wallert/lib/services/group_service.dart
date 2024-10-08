import 'dart:convert';
import 'package:book_wallert/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'package:book_wallert/models/group_model.dart';
import 'package:book_wallert/models/user.dart';

class GroupService {
  final String _baseUrl = '${ip}/api/groups'; // Replace with your API base URL

  Future<void> createGroup(String groupName, String groupDescription,
      String groupImageUrl, String token) async {
    final url = Uri.parse('$_baseUrl/create');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'group_name': groupName,
        'group_description': groupDescription,
        'group_image_url': groupImageUrl,
        'token': token,
      }),
    );

    if (response.statusCode == 200) {
      // Group created successfully
      print('Group created successfully');
    } else {
      // Handle errors
      print('Failed to create group: ${response.statusCode}');
      throw Exception('Failed to create group');
    }
  }

  Future<List<GroupModel>> getGroupsByUserId(String? token) async {
    final url = Uri.parse('$_baseUrl/user-groups');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> groupData = jsonDecode(response.body);
      return groupData.map((json) => GroupModel.fromJson(json)).toList();
    } else {
      print('Failed to fetch groups: ${response.statusCode}');
      throw Exception('Failed to fetch groups');
    }
  }

  Future<GroupModel> getGroupById(String groupId) async {
    final url = Uri.parse('$_baseUrl/$groupId');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final groupData = jsonDecode(response.body);
      return GroupModel.fromJson(groupData);
    } else {
      print('Failed to fetch group: ${response.statusCode}');
      throw Exception('Failed to fetch group');
    }
  }

  Future<List<User>> getMembersByGroupId(int groupId) async {
    final url = Uri.parse('$_baseUrl/$groupId/members');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> membersData = jsonDecode(response.body);
      return membersData.map((json) => User.fromJson(json)).toList();
    } else {
      print('Failed to fetch members: ${response.statusCode}');
      throw Exception('Failed to fetch members');
    }
  }

  Future<List<User>> getMemberRequestsByGroupId(int groupId) async {
    final url = Uri.parse('$_baseUrl/$groupId/requests');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> requestData = jsonDecode(response.body);
      return requestData.map((json) => User.fromJson(json)).toList();
    } else {
      print('Failed to fetch member requests: ${response.statusCode}');
      throw Exception('Failed to fetch member requests');
    }
  }

  Future<bool> checkAdminStatus(int groupId, String token) async {
    final url = Uri.parse('$_baseUrl/$groupId/check-admin');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // The backend should return a JSON response like: { "isAdmin": true/false }
      final data = jsonDecode(response.body);
      return data['isAdmin'];
    } else {
      print('Failed to check admin status: ${response.statusCode}');
      throw Exception('Failed to check admin status');
    }
  }

  // Accept Member Request
  Future<void> acceptMemberRequest(
      int groupId, int userId, String token) async {
    final url = Uri.parse('$_baseUrl/accept-user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'user_id': userId,
        'group_id': groupId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to accept member request');
    }
  }

  // Remove Member Request
  Future<void> removeMemberRequest(
      int groupId, int userId, String token) async {
    final url = Uri.parse('$_baseUrl/request/remove');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'user_id': userId,
        'group_id': groupId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove member request');
    }
  }

  // Send Join Request
  Future<void> sendJoinRequest(int groupId, String token) async {
    final url = Uri.parse('$_baseUrl/send/join-request');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'group_id': groupId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send join request');
    }
  }

  // Cancel Join Request
  Future<void> cancelJoinRequest(int groupId, String token) async {
    final url = Uri.parse('$_baseUrl/cancel-join-request');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'group_id': groupId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to cancel join request');
    }
  }
}
