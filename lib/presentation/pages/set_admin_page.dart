import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/set_admin_cubit/set_admin_cubit.dart';
import 'package:wafaq_x/controllers/set_admin_cubit/set_admin_state.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';

import '../../models/admin_model/admin_model.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';
import '../widgets/buttons/circular_button.dart';

class SetAdminPage extends StatefulWidget {
  const SetAdminPage({Key? key}) : super(key: key);


  @override
  _SetAdminPageState createState() => _SetAdminPageState();
}

class _SetAdminPageState extends State<SetAdminPage> {

  final adminFromKey = GlobalKey<FormState>();

  final String  endOfAccountName = '@waffaqx.com';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  late bool addMobilesPowerValue = false, deleteMobilesPowerValue = false,
  addCoversPowerValue = false, deleteCoversPowerValue = false,
  addGlassesPowerValue = false, deleteGlassesPowerValue = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            setNewAdminText,
          ),
        ),
        body: Padding(
          padding: paddingH16,
          child: ListView(
            padding: padding0,
            children: [
              gap8,
              addNewMobileForm(),
              gap24,
              const SideTitle(title: powersText),
              Row(
                children: [
                  Checkbox(
                      value: addMobilesPowerValue,
                      onChanged: (value){
                        setState(() {
                          addMobilesPowerValue = value!;
                        });
                      }
                  ),
                  const Text(
                    addMobilesText,
                  )
                ],
              )
              ,Row(
                children: [
                  Checkbox(
                      value: addCoversPowerValue,
                      onChanged: (value){
                        setState(() {
                          addCoversPowerValue = value!;
                        });
                      }
                  ),
                  const Text(
                    addCoversCompatibilitiesText,
                  ),
                  Checkbox(
                      value: deleteCoversPowerValue,
                      onChanged: (value){
                        setState(() {
                          deleteCoversPowerValue = value!;
                        });
                      }
                  ),
                  const Text(
                    deleteCoversCompatibilitiesText,
                  ),
                ],
              ),
              gap56,
              BlocConsumer<SetAdminCubit, SetAdminState>(
                listener: (context, state){
                  if (state is AdminAddedSuccessfully){
                    showMySnackBar(context: context, content: adminAddedSuccessfullyText, color: Colors.green);
                  }else if (state is FailedToAddAdmin){
                    showMySnackBar(context: context, content: anErrorOccurredText, color: Colors.red);
                  }
                },
                builder: (context, state){
                  if (state is SetAdminInProgress){
                    return const LoadingButton();
                  }
                  return CircularButton(text: additionText, filled: true, onPressed: (){
                    if (adminFromKey.currentState!.validate()){

                      AdminModel adminModel = AdminModel(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          mobileNumber: mobileNumController.text,
                          storeName: storeNameController.text,
                          address: addressController.text,
                          addMobiles: addMobilesPowerValue,
                          deleteMobiles: deleteMobilesPowerValue,
                          addCovers: addCoversPowerValue,
                          deleteCovers: deleteCoversPowerValue,
                          addGlasses: addGlassesPowerValue,
                          deleteGlasses: deleteGlassesPowerValue
                      );
                      BlocProvider.of<SetAdminCubit>(context).setAdmin(adminModel: adminModel);
                    }
                  },);
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
        key: adminFromKey,
        child: Column(
          children: [
// admin field
            TextFormField(
              decoration: const InputDecoration(
                labelText: nameText,
              ),
              controller: nameController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return nameErrorText;
                }
                return null;
              },
            ),
// email field
            TextFormField(
              decoration: const InputDecoration(
                labelText: emailText,
              ),
              controller: emailController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return emailErrorText;
                }
                else if (!text.contains(endOfAccountName)){
                  return endOfEmailErrorText;
                }
                return null;
              },
            ),
// password field
            TextFormField(
              decoration: const InputDecoration(
                labelText: passwordText,
              ),
              controller: passwordController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return passwordErrorText;
                }
                return null;
              },
            ),
// mobile number field
            TextFormField(
              decoration: const InputDecoration(
                labelText: mobileNumText,
              ),
              controller: mobileNumController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return mobileNumErrorText;
                }
                return null;
              },
            ),
// store field
            TextFormField(
              decoration: const InputDecoration(
                labelText: storeNameText,
              ),
              controller: storeNameController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                   return storeNameErrorText;
                }
                return null;
              },
            ),
// address field
            TextFormField(
              decoration: const InputDecoration(
                labelText: addressText,
              ),
              controller: addressController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return addressErrorText;
                }
                return null;
              },
            ),
          ],

        ),
      ),
    );
  }

}
