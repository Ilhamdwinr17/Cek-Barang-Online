import 'package:supabase/supabase.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class SupabaseService {
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';

  final SupabaseClient client;

  SupabaseService._privateConstructor()
      : client = SupabaseClient(supabaseUrl, supabaseAnonKey);

  static final SupabaseService instance = SupabaseService._privateConstructor();

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
