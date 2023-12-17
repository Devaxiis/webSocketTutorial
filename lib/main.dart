import 'package:flutter/material.dart';
import 'package:web_socket/app.dart';
import 'package:web_socket/servcie/socket_servcie.dart';

void main() {
  SocketService.init();
  runApp(const MyApp());
}
