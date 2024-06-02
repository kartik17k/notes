import 'package:isar/isar.dart';

//to generate file
// by running dart run build_runner build we create database of our own it is notes
part 'note.g.dart';

@Collection()
class Note{
  Id id = Isar.autoIncrement;
  late String text;


}


