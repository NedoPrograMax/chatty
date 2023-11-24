import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

CategoriesRecord? newCustomFunction(
  List<CategoriesRecord>? categories,
  String? categoryName,
) {
  return categories?.firstWhere((el) => el.name == categoryName);
}

List<DocumentReference> addUserToList(
  List<DocumentReference> users,
  DocumentReference user,
) {
  users.add(user);
  return users;
}

List<DocumentReference> getAllUsersRefsFromTasks(List<TasksRecord> tasks) {
  final allUsers = <DocumentReference>[];
  tasks.forEach((e) => allUsers.addAll(e.usersRef));
  final usersSet = allUsers.toSet();
  final users = usersSet.toList();
  return users;
}
