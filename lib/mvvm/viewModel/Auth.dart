import '../const/const.dart';

class AuthLord {
  askAbout(
      {required String teacherSubject,
      required String Subject,
      required String title,
      required String desctiption}) async {

    await askAboutApplicationAdmin.add({
      "Teach Name": teacherSubject,
      "Select Subject": Subject,
      "title": title,
      "description": desctiption
    });
  }
}
