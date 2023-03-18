import 'package:camera/camera.dart';
import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key, required this.cameras, this.packageDetails = false})
      : super(key: key);
  static String routeName = 'cameraPage';

  final List<CameraDescription>? cameras;
  bool packageDetails;
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      print("here image is this" + picture.name);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => PreviewPage(
      //               picture: picture,
      //             )));
      Navigator.pop(context, picture);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        (_cameraController.value.isInitialized)
            ? CameraPreview(_cameraController)
            : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
        Align(
            alignment: Alignment.bottomCenter,
            child: widget.packageDetails
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    decoration: const BoxDecoration(
                      color: ColorValues.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Take a Selfie".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const Divider(
                            color: ColorValues.disabledColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                    text:
                                        "* Take the image from the Right Angle\n",
                                    children: const [
                                  TextSpan(text: "* Good Lighting\n"),
                                  TextSpan(
                                      text: "* Make sure you take clear image ")
                                ])),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomRoundedButton(
                              color: ColorValues.primaryColor,
                              isEnabled: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: applyPaddingX(4)),
                                child: Text(
                                  'Okay! Got It.',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  widget.packageDetails = false;
                                });
                              },
                            ),
                          ),
                        ]))
                : Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                        color: Colors.black),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 30,
                            icon: Icon(
                                _isRearCameraSelected
                                    ? CupertinoIcons.switch_camera
                                    : CupertinoIcons.switch_camera_solid,
                                color: Colors.white),
                            onPressed: () {
                              setState(() => _isRearCameraSelected =
                                  !_isRearCameraSelected);
                              initCamera(widget
                                  .cameras![_isRearCameraSelected ? 0 : 1]);
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            onPressed: takePicture,
                            iconSize: 50,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.circle, color: Colors.white),
                          )),
                          const Spacer(),
                        ]),
                  )),
      ]),
    ));
  }
}
