import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/data/entities/mobile_model/battery.dart';
import 'package:wafaq_x/data/entities/mobile_model/dimensions_and_weight.dart';
import 'package:wafaq_x/data/entities/mobile_model/display.dart';
import 'package:wafaq_x/data/repos/mobiles_repository_impl.dart';
import 'package:wafaq_x/domain/use_cases/mobiles_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/add_mobile_cubit/add_mobile_cubit.dart';
import 'package:wafaq_x/presentation/bloc/add_mobile_cubit/add_mobile_state.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/helper/helper.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';



class AddMobilePage extends StatefulWidget {
  const AddMobilePage({Key? key}) : super(key: key);

  static String routeName = 'addMobileScreen';
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
    return BlocProvider<AddMobileCubit>(
      create: (context) =>
          AddMobileCubit(MobilesUseCases(MobilesRepositoryImpl(FirebaseDataSource()))),
      child: Directionality(
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
                    }else if (state is AddingMobileFailure){
                      showMySnackBar(context: context, content: anErrorOccurred, color: Colors.red);
                    }
                  },
                  builder: (context, state){
                    if (state is AddingMobileInProgress){
                      return const LoadingButton();
                    }
                    return CircularButton(text: additionText, filled: true, onPressed: (){
                      if (mobileFromKey.currentState!.validate()){
                        MobileModel mobileModel = MobileModel(
                            brandName: _brandName,
                            mobileId: '${mobileNameController.text}-${_helper.getRandomNumber()}',
                            mobileName: mobileNameController.text,
                            display: Display(
                              displayResolution: displayResolutionController.text,
                              displaySize: _helper.toDouble(displaySizeController.text),
                              displayType: displayTypeController.text,
                              frequency: displayFrequencyController.text,
                              pixelDensity: pixelDensityController.text,
                            ),
                            dimensionsAndWeight: DimensionsAndWeight(
                              dimensions: dimensionsController.text,
                              weight: weightController.text,
                            ),
                            networkTechnology: networkTechnologyController.text,
                            processor: processorController.text,
                            storageAndRam: _helper.splitTextToList(text: storageAndRamController.text),
                            mainCameras: _helper.splitTextToList(text: mainCameraController.text),
                            selfieCameras: _helper.splitTextToList(text: selfieCameraController.text),
                            battery: Battery(
                              battery: batteryController.text,
                              chargingSpeed: chargingInletController.text,
                            ),
                            chargingInlet: chargingInletController.text,
                            os: osController.text,
                            hasNotch: _hasNotch
                        );
                        BlocProvider.of<AddMobileCubit>(context).addMobile(mobile: mobileModel);
                      }
                    });

                  },

                ),
                gap8,
              ],
            ),
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
// display type
            TextFormField(
              decoration: const InputDecoration(
                labelText: displayTypeHintText,
              ),
              controller: displayTypeController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return displayTypeErrorText;
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
// display resolution field
            TextFormField(
              decoration: const InputDecoration(
                labelText: displayResolutionHintText,
              ),
              controller: displayResolutionController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return displayResolutionErrorText;
                }
                return null;
              },
            ),
// pixel density field
            TextFormField(
              decoration: const InputDecoration(
                labelText: pixelDensityHintText,
              ),
              controller: pixelDensityController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return pixelDensityErrorText;
                }
                return null;
              },
            ),
// display frequency field
            TextFormField(
              decoration: const InputDecoration(
                labelText: displayFrequencyHintText,
              ),
              controller: displayFrequencyController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return displayFrequencyErrorText;
                }
                return null;
              },
            ),
// dimensions field
            TextFormField(
              decoration: const InputDecoration(
                labelText: dimensionsHintText,
              ),
              keyboardType: TextInputType.text,
              controller: dimensionsController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return dimensionsErrorText;
                }
                return null;
              },
            ),
// weight field
            TextFormField(
              decoration: const InputDecoration(
                labelText: weightHintText,
              ),
              keyboardType: TextInputType.text,
              controller: weightController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return weightErrorText;
                }
                return null;
              },
            ),
// network technology field
            TextFormField(
              decoration: const InputDecoration(
                labelText: networkTechnologyHintText,
              ),
              keyboardType: TextInputType.text,
              controller: networkTechnologyController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return networkTechnologyErrorText;
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
// charging speed field
            TextFormField(
              decoration: const InputDecoration(
                labelText: chargingSpeedHintText,
              ),
              controller: chargingSpeedController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return chargingSpeedErrorText;
                }
                return null;
              },
            ),


// charging inlet field
            TextFormField(
              decoration: const InputDecoration(
                labelText: chargingInletHintText,
              ),
              controller: chargingInletController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return chargingInletErrorText;
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
