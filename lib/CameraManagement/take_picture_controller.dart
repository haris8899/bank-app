import 'package:bank_flutter/CameraManagement/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureController extends StatefulWidget {

  TakePictureController({super.key});

  @override
  State<TakePictureController> createState() => _TakePictureControllerState();
}

class _TakePictureControllerState extends State<TakePictureController> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      CameraDescription(
          name: '0',
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 1),
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,foregroundColor: Colors.white,),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(child: CameraPreview(_controller));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      imagePath: image.path,
                    ),
                  ),
                );
              } catch (e) {
                // If an error occurs, log the error to the console.
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
