import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_recruitment/util/HttpUtils.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
class AppUpdate {
  //获取 TargetPlatform只的函数
  TargetPlatform get defaultTargetPlatform {
    TargetPlatform result;
    //这里根据平台来赋值，但是只有iOS、Android、Fuchsia，没有PC
    if (Platform.isIOS) {
      result = TargetPlatform.iOS;
    } else if (Platform.isAndroid) {
      result = TargetPlatform.android;
    } else if (Platform.isFuchsia) {
      result = TargetPlatform.fuchsia;
    }
    assert(() {
      if (Platform.environment.containsKey('FLUTTER_TEST'))
        result = TargetPlatform.android;
      return true;
    }());
    // //这里判断debugDefaultTargetPlatformOverride有没有值，有值的话，就赋值给result
    // if (debugDefaultTargetPlatformOverride != null)
    //   result = debugDefaultTargetPlatformOverride;

    //如果到这一步，还没有取到 TargetPlatform 的值，就会抛异常
    if (result == null) {
      throw FlutterError('Unknown platform.\n'
          '${Platform.operatingSystem} was not recognized as a target platform. '
          'Consider updating the list of TargetPlatforms to include this platform.');
    }
    return result;
  }

  var http = new HttpClient();
  final String downLoadUrl = '';
  Future<bool> checkNewVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    try {
       final res =  await HttpUtils.request('/appVersion', method: HttpUtils.GET, data: {});
       print(res);
      // if (res.statusCode == 200) {
      //   final Map<String, dynamic> body = json.decode(res.body);
      //   if (defaultTargetPlatform == TargetPlatform.android) {
      //     final packageInfo = await PackageInfo.fromPlatform();
          final newVersion = '1.1.0';
          return (newVersion.compareTo(packageInfo.version) == 1);
      //   }
      // }
    } catch (e) {
      return false;
    }
    return false;
  }

//是否有权限
  Future<bool> checkPermission() async {
    bool isWrite = await PermissionHandler().openAppSettings();
    return isWrite;
  }

  //打开权限
  Future<PermissionStatus> requestPermission() async {
     Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    return PermissionStatus.granted;
  }

// 获取安装地址
  Future<String> get _apkLocalPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

// 下载
  Future<void> executeDownload() async {
    final path = await _apkLocalPath;
    print(path);
    //下载
    final taskId = await FlutterDownloader.enqueue(
        // url: 'https://raw.githubusercontent.com/WVector/AppUpdateDemo/master/apk/sample-debug.apk',
        url: 'https://test1.4q.sk/flutter_hello_world.apk',
        savedDir: path,
        fileName: 'JDMALL-PC2.apk',
        showNotification: true,
        openFileFromNotification: true);
    FlutterDownloader.registerCallback((id, status, progress) {
       print(
            'Download task ($id) is in status ($status) and process ($progress)');
      // 当下载完成时，调用安装
      if (taskId == id && status == DownloadTaskStatus.complete) {
         OpenFile.open(path);
          FlutterDownloader.open(taskId: id);
        // _installApk();
      }
    });
  }

// 安装
  Future<Null> _installApk() async {
    // XXXXX为项目名
    const platform = const MethodChannel('social_recruitment');
    print(platform);
    try {
      final path = await _apkLocalPath;
       print(path);
      // 调用app地址
      await platform
          .invokeMethod('install', {'path': path + '/JDMALL-PC2.apk'});
    } on PlatformException catch (_) {}
  }
}

