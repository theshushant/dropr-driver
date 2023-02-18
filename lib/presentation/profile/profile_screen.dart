import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/presentation/profile/section_user_row.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';

  ProfileScreen({
    Key? key,
  }) : super(key: key);
  final Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.all(
                applyPaddingX(1),
              ),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          title: Text(
            StringValue.profile,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Container(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StoreObserver(builder: (UserStore store, BuildContext context) {
                  if (store.user == null && !store.isLoading) {
                    // storestore.
                    return SizedBox();
                  }
                  if (store.isLoading) {
                    return CircularProgressIndicator();
                  }
                  return SectionUserRow(
                    user: store.user!,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
