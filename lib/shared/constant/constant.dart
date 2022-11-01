import 'dart:ui';

late Size size;

String token = '';
String? lang;
bool? isDark;
String? role;

List<String> nameOfColumnMed = [
  'name',
  'number of doses',
  'dose description',
  'number of cans',
];
List<String> nameOfColumnTes = [
  'name',
  'description',
];
List<String> nameOfColumnInv = [
  'title',
  'price',
];
List<String> nameOfTable = ['Medications', 'Test Reports', 'Invoice Details'];
List<List<String>> nameOfColumns = [
  nameOfColumnMed,
  nameOfColumnTes,
  nameOfColumnInv
];
String baseUrl = 'http://192.168.137.45:8000/api/';
String imageUrl = 'http://192.168.137.45:8000/';
