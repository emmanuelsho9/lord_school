import 'dart:io';

import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

class download{


  Future<bool>getStoragePermission()async{
    return await Permission.storage.request().isGranted;

  }

  Future<String> getDownloadFile() async {
    return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
  }

  Future downloadFile(String downloadDir)async{
    Dio dio = Dio();
    var downloadePdf = "$downloadDir/pdf";
  try{
    dio.download("https://www.nichemarket.co.za/admin/Content/images/metaDisplayImages/google-logo-805x452.jpg", downloadePdf,
    onReceiveProgress: (count, total) {

    },
    );
  }catch (e){}
  }

  Future<void> doDownloadFile()async {
    if(await getStoragePermission()){
      String downloadDirectory = await getDownloadFile();
      await downloadFile(downloadDirectory).then((value) {});
    }
  }
}