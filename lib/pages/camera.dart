import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:loannow/utils/operation_utils.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraPageState();
  }
}

class CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return CameraCamera(onFile: (file) => {Navigator.pop(context, file.path)});
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation('/camera');
  }
}
