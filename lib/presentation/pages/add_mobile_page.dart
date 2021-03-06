import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/add_mobile_cubit/add_mobile_states.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';
import '../../controllers/add_mobile_cubit/add_mobile_cubit.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';
import '../../utilities/helper/helper.dart';


class AddMobilePage extends StatefulWidget {
  const AddMobilePage({Key? key}) : super(key: key);

  @override
  _AddMobilePageState createState() => _AddMobilePageState();
}

class _AddMobilePageState extends State<AddMobilePage> {

  String _brandName = 'brand';
  bool _hasNotch = false;

  final mobileFromKey = GlobalKey<FormState>();
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController displayTypeController = TextEditingController();
  TextEditingController displaySizeController = TextEditingController();
  TextEditingController displayResolutionController = TextEditingController();
  TextEditingController pixelDensityController = TextEditingController();
  TextEditingController displayFrequencyController = TextEditingController();
  TextEditingController dimensionsController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController networkTechnologyController = TextEditingController();
  TextEditingController storageAndRamController = TextEditingController();
  TextEditingController mainCameraController = TextEditingController();
  TextEditingController selfieCameraController = TextEditingController();
  TextEditingController chargingSpeedController = TextEditingController();
  TextEditingController chargingInletController = TextEditingController();
  TextEditingController processorController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  TextEditingController camerasController = TextEditingController();
  TextEditingController osController = TextEditingController();
  TextEditingController batteryController = TextEditingController();


  Helper _helper = Helper();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            newPhoneSpecificationsText,
          ),
        ),
        body: Padding(
          padding: padding8,
          child: ListView(
            padding: padding0,
            children: [
              gap8,
              addNewMobileForm(),
              gap24,
              BlocConsumer<AddMobileCubit, AddMobileState>(
                listener: (context, state){
                  if (state is MobileAddedSuccessfully){
                    showMySnackBar(context: context, content: mobileAddedSuccessfullyText, color: Colors.green);
                  }else if (state is FailedToAddMobile){
                    showMySnackBar(context: context, content: anErrorOccurredText, color: Colors.red);
                  }
                },
                builder: (context, state){
                  if (state is AddingMobile){
                    return const LoadingButton();
                  }
                  return CircularButton(text: additionText, filled: true, onPressed: (){
                    if (mobileFromKey.currentState!.validate()){
                      MobileModel mobileModel = MobileModel(
                          brandName: _brandName,
                          mobileId: mobileNameController.text,
                          mobileName: mobileNameController.text,
                          displaySize: _helper.toDouble(displaySizeController.text),
                          processor: processorController.text,
                          storageAndRam: _helper.splitTextToList(text: storageAndRamController.text),
                          mainCameras: _helper.splitTextToList(text: mainCameraController.text),
                          selfieCameras: _helper.splitTextToList(text: selfieCameraController.text),
                          battery: batteryController.text,
                          os: osController.text,
                          hasNotch: _hasNotch
                      );
                      BlocProvider.of<AddMobileCubit>(context).addMobile(mobileModel: mobileModel);
                    }
                  });

                },

              ),
              gap8,
            ],
          ),
        ),
      ),
    );
  }

  addNewMobileForm(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: mobileFromKey,
        child: Column(
          children: [
// brand name
            DropdownButtonFormField<String>(
              isExpanded: true,
              hint: const Text(
                choiceBrandText,
              ),
              onChanged: (value) {
                _brandName = value!;
              },
              validator: (value){
                if (value == null){
                  return choiceBrandText;
                }
                return null;
              },
              items: brandsNamesTextsList
                  .map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                  ),
                );
              }).toList(),
            ),
// mobile name
            TextFormField(
              decoration: const InputDecoration(
                labelText: mobileNameHintText,
              ),
              controller: mobileNameController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return mobileNameErrorText;
                }
                return null;
              },
            ),
// display size
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: displaySizeHintText,
              ),
              controller: displaySizeController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return displaySizeErrorText;
                }
                return null;
              },
            ),
// processor field
            TextFormField(
              decoration: const InputDecoration(
                labelText: processorHintText,
              ),
              controller: processorController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return processorErrorText;
                }
                return null;
              },
            ),
// storage and ram field
            TextFormField(
              decoration: const InputDecoration(
                labelText: storageAndRamHintText,
              ),
              keyboardType: TextInputType.text,
              controller: storageAndRamController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return storageAndRamErrorText;
                }
                return null;
              },
            ),
// main camera field
            TextFormField(
              decoration: const InputDecoration(
                labelText: mainCameraHintText,
              ),
              keyboardType: TextInputType.text,
              controller: mainCameraController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return mainCameraErrorText;
                }
                return null;
              },
            ),
// selfie camera field
            TextFormField(
              decoration: const InputDecoration(
                labelText: selfieCameraHintText,
              ),
              keyboardType: TextInputType.text,
              controller: selfieCameraController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return selfieCameraErrorText;
                }
                return null;
              },
            ),// selfie camera field
// battery field
            TextFormField(
              decoration: const InputDecoration(
                labelText: batteryHintText,
              ),
              controller: batteryController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return batteryErrorText;
                }
                return null;
              },
            ),
// os field
            TextFormField(
              decoration: const InputDecoration(
                labelText: osHintText,
              ),
              controller: osController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return osErrorText;
                }
                return null;
              },
            ),
// gap
            gap16,
// has notch check box
            Row(
              children: [
                SizedBox(
                  width: size24,
                  height: size24,
                  child: Checkbox(
                      value: _hasNotch,
                      onChanged: (value){
                        setState(() {
                          _hasNotch = value!;
                        });
                      }
                  ),
                ),
                const Text(
                  notchText,
                  style: TextStyle(
                    fontSize: size16,
                  ),
                ),

              ],
            ),
          ],

        ),
      ),
    );
  }

}
