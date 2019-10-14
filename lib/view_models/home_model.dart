import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

enum PlayerState { playing, paused, stopped }

class HomeModel with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = "";
  PlayerState _playerState = PlayerState.stopped;
  List<FileSystemEntity> files;

  // Getters
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  PlayerState get playerState => _playerState;

  Future get _localPath async {
    // Application documents directory: /data/user/0/{package_name}/{app_name}

    // final applicationDirectory = await getApplicationDocumentsDirectory();

    // // External storage directory: /storage/emulated/0

    final externalDirectory = await getExternalStorageDirectory();

    // // Application temporary directory: /data/user/0/{package_name}/cache

    // final tempDirectory = await getTemporaryDirectory();

    return externalDirectory.path;
  }

  get _musicStoragePath async {
    String basePath = await _localPath;
    return basePath + '/muzika/';
  }

  AudioPlayer audioPlayer = new AudioPlayer();

  String kUrl =
      "https://cdns-preview-1.dzcdn.net/stream/c-13039fed16a173733f227b0bec631034-10.mp3";

  switchPlayerState(PlayerState playerState) {
    _playerState = playerState;
    notifyListeners();
  }

  Future<void> play() async {
    await audioPlayer.play(kUrl);
    switchPlayerState(PlayerState.playing);
  }

  Future<void> playLocal(path) async {
    await audioPlayer.play(path, isLocal: true);
    switchPlayerState(PlayerState.playing);
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    switchPlayerState(PlayerState.paused);
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    switchPlayerState(PlayerState.stopped);
  }

  void downloadFile() async {
    Dio dio = new Dio();
    String storagePath = await _musicStoragePath;
    // String fileName = AppFunctions.randomString(9) + ".mp3";
    String fileName = "Eminem - Lose Yourself (From 8 Mile Soundtrack).mp3";

    String fullStoragePath = storagePath + fileName;

    // Check if directory Exists
    await createFileDirectory();

    await dio.download(kUrl, fullStoragePath);
  }

  void listofFiles() async {
    // Check if directory Exists
    await createFileDirectory();

    String storagePath = await _musicStoragePath;
    files = Directory("$storagePath").listSync();
    notifyListeners();
  }

  Future<void> createFileDirectory() async {
    String storagePath = await _musicStoragePath;
    bool exists = await Directory(storagePath).exists();
    if (!exists) {
      await Directory(storagePath).create(recursive: true);
    }
  }
}
