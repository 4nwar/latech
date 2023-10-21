import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  CameraView(
      {Key? key,
      required this.customPaint,
      this.text,
      required this.textWidget,
      required this.onImage,
      this.onScreenModeChanged,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final CustomPaint? customPaint;
  File? imageTaken;
  final String? text;
  final Widget? textWidget;
  final Function(InputImage inputImage) onImage;
  final Function(ScreenMode mode)? onScreenModeChanged;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  bool _isCameraInitialized = false;
  ScreenMode _mode = ScreenMode.liveFeed;
  CameraController? _controller;
  File? _image;
  String? _path;
  ImagePicker? _imagePicker;
  int _cameraIndex = -1;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;

  bool isFlashOff = false;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();

    if (cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      for (var i = 0; i < cameras.length; i++) {
        if (cameras[i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
      }
    }

    if (_cameraIndex != -1) {
      _startLiveFeed();
    } else {
      _mode = ScreenMode.gallery;
    }

    _controller!.setFlashMode(FlashMode.off);
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN);
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   leading: IconButton(
        //       onPressed: (){
        //         Get.offAllNamed(Routes.MAIN);
        //       }, icon: const Icon(Icons.close)),
          // actions: [
          //   if (_allowPicker)
          //     Padding(
          //       padding: const EdgeInsets.only(right: 20.0),
          //       child: GestureDetector(
          //         onTap: _switchScreenMode,
          //         child: Icon(
          //           _mode == ScreenMode.liveFeed
          //               ? Icons.photo_library_outlined
          //               : (Platform.isIOS
          //                   ? Icons.camera_alt_outlined
          //                   : Icons.camera),
          //         ),
          //       ),
          //     ),
          // ],
        // ),
        body: _body(),
        // floatingActionButton: _floatingActionButton(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _flashButton(Size size){
    return Container(
      height: roundButtonSize * 0.8,
      width: roundButtonSize * 0.8,
      margin: EdgeInsets.only(bottom: size.height * 0.06, right: size.width * 0.14),
      // decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     border: Border.all(color: primaryAccent)
      // ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              (isFlashOff)? "On" : "Off",
              style: textCustom(FontWeight.w100, 14, primaryAccent),),
          ),
          Positioned.fill(
            child: IconButton(
                onPressed: (){
                  setState(() {
                    if(isFlashOff){
                      _controller!.setFlashMode(FlashMode.off);

                    } else{
                      _controller!.setFlashMode(FlashMode.always);
                    }
                    isFlashOff = !isFlashOff;
                  });
                },
                icon: Icon(
                  (isFlashOff)? Icons.flash_on: Icons.flash_off,
                  color: primaryAccent,
                  size: 38,
                )
            ),
          ),
        ],
      )
    );
  }

  Widget? _floatingActionButton() {
    if (_mode == ScreenMode.gallery) return null;
    if (cameras.length == 1) return null;
    return SizedBox(
        height: roundButtonSize,
        width: roundButtonSize,
        child: FloatingActionButton(
          backgroundColor: primaryAccent,
          onPressed: _takePicture,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: primary,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryAccent,
                    shape: BoxShape.circle
                ),
              ),
            ),
          )
        ));
  }

  Widget _body() {
    Widget body;
    if (_mode == ScreenMode.liveFeed) {
      body = _liveFeedBody();
    } else {
      body = _galleryBody();
    }
    return body;
  }

  Widget _liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: _changingCameraLens
                  ? const Center(
                      child: Text('Changing camera lens'),
                    )
                  : CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,

          // widget.textWidget ?? Container(),
          // if (widget.imageTaken != null)
          //   SizedBox(
          //       width: double.infinity,
          //       height: double.infinity,
          //       child: Image.file(
          //         widget.imageTaken!,
          //         fit: BoxFit.cover,
          //       )),
          // Positioned(
          //   bottom: 200,
          //   left: 50,
          //   right: 50,
          //   child: ElevatedButton(
          //     child: const Text('Take.'),
          //     onPressed: () {
          //       _takePicture();
          //     },
          //   ),
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.03),
              child: IconButton(
                  onPressed: (){
                    Get.offAllNamed(Routes.MAIN);
                  }, icon: Icon(Icons.close, color: primaryAccent, size: 32,)),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _flashButton(size)
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: size.height * 0.05),
                  child: _floatingActionButton() ?? Container())),
          Positioned(
            bottom: 120,
            left: 50,
            right: 50,
            child: Slider(
              thumbColor: primary,
              activeColor: primaryAccent,
              inactiveColor: inactive,
              value: zoomLevel,
              min: minZoomLevel,
              max: maxZoomLevel,
              onChanged: (newSliderValue) {
                setState(() {
                  zoomLevel = newSliderValue;
                  _controller!.setZoomLevel(zoomLevel);
                });
              },
              divisions: (maxZoomLevel - 1).toInt() < 1
                  ? null
                  : (maxZoomLevel - 1).toInt(),
            ),
          )
        ],
      ),
    );
  }

  Widget _galleryBody() {
    return ListView(shrinkWrap: true, children: [
      _image != null
          ? SizedBox(
              height: 400,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.file(_image!),
                  if (widget.customPaint != null) widget.customPaint!,
                ],
              ),
            )
          : const Icon(
              Icons.image,
              size: 200,
            ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('From Gallery'),
          onPressed: () => _getImage(ImageSource.gallery),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('Take a picture'),
          onPressed: () => _getImage(ImageSource.camera),
        ),
      ),
      if (_image != null)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '${_path == null ? '' : 'Image path: $_path'}\n\n${widget.text ?? ''}'),
        ),
    ]);
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      _image = null;
      _path = null;
    });
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    }
    setState(() {});
  }

  void _switchScreenMode() {
    _image = null;
    if (_mode == ScreenMode.liveFeed) {
      _mode = ScreenMode.gallery;
      _stopLiveFeed();
    } else {
      _mode = ScreenMode.liveFeed;
      _startLiveFeed();
    }
    if (widget.onScreenModeChanged != null) {
      widget.onScreenModeChanged!(_mode);
    }
    setState(() {});
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420
    );

    
    _controller?.initialize().then((_) async {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
      _controller?.startImageStream(_processCameraImage);

      // Initialize controller
      try {
        await _controller?.initialize();
      } on CameraException catch (e) {
        print('Error initializing camera: $e');
      }

      // Update the Boolean
      if (mounted) {
        setState(() {
           _isCameraInitialized = _controller!.value.isInitialized;
        });
      }
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  Future _takePicture() async {
    try {
      // widget.takenPhoto = await _controller?.takePicture();
      await _controller?.stopImageStream();
      XFile? file = await _controller?.takePicture();
      if (file != null) {
        File inputFile = File(file.path);
        Get.toNamed(Routes.RESULT, arguments: inputFile);
      }
    } catch (e) {}
  }

  Future _processPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[_cameraIndex];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }
}