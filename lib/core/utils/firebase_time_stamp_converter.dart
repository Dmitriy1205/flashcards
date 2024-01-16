import 'package:cloud_firestore/cloud_firestore.dart';

///Used for toJson() and fromJson() operations over firebase Timestamps
class FirebaseTimestampConverters{
  static DateTime fromTimestamp(dynamic timestamp){
    if(timestamp is int){
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    }else if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else {
      throw ArgumentError("Unsupported timestamp type");
    }
  }
  static String toTimestampString(DateTime date){
    return date.toUtc().toIso8601String();
  }
  static Timestamp toTimestamp(DateTime date){
    return Timestamp.fromDate(date);
  }
}