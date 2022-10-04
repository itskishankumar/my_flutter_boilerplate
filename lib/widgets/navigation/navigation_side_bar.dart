import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_screens.dart';
import '../../constants/assets.dart';
import '../../controllers/modal_controller.dart';

class NavigationSideBar extends StatefulWidget {
  const NavigationSideBar({Key? key}) : super(key: key);

  @override
  State<NavigationSideBar> createState() => _NavigationSideBarState();
}

class _NavigationSideBarState extends State<NavigationSideBar> {
  final ModalController modalController = Get.find();

  List<bool> _isExpanded = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.onTertiary,
      padding: const EdgeInsets.only(top: Spacing.extraLarge),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.regular),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(ImagePath.applogo),
              ],
            ),
            const SizedBox(height: Spacing.large),
            Text('Pugeshwar Chewdury', style: Get.theme.textTheme.headline2),
            const SizedBox(height: Spacing.small),
            Text('pugeshwarchew@dogmail.com', style: Get.theme.textTheme.bodyText1),
            const SizedBox(height: Spacing.regular),
            Divider(height: 1, thickness: 1, color: Get.theme.colorScheme.tertiary),
            const SizedBox(height: Spacing.regular),
            box(
              iconPath: IconPath.home,
              title: "Home",
              onTap: () {
                modalController.closeModal();
                Get.toNamed(AppScreen.farm);
              },
            ),
            const SizedBox(height: Spacing.regular),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) => setState(() => _isExpanded[index] = !isExpanded),
                expandedHeaderPadding: EdgeInsets.zero,
                children: [
                  ExpansionPanel(
                    backgroundColor: const Color(0xff4A514C),
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) =>
                        box(iconPath: IconPath.agriculture, title: "Farms", noBackground: true),
                    body: Column(
                      children: [
                        box(title: "Farm 1", subsection: true, noBackground: true),
                        box(title: "Farm 2", subsection: true, noBackground: true),
                        box(title: "Farm 3", subsection: true, noBackground: true),
                      ],
                    ),
                    isExpanded: _isExpanded[0],
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.regular),
            box(
              iconPath: IconPath.agronomistManagement,
              title: "Agronomists",
              onTap: () {
                modalController.closeModal();
                Get.toNamed(AppScreen.allAgronomists);
              },
            ),
            const SizedBox(height: Spacing.regular),
            box(
              iconPath: IconPath.labourers,
              title: "Labourers",
              onTap: () {
                modalController.closeModal();
                Get.toNamed(AppScreen.allAgronomists);
              },
            ),
            const SizedBox(height: Spacing.regular),
            box(
              iconPath: IconPath.profile,
              title: "Profile",
              onTap: () {
                modalController.closeModal();
                Get.toNamed(AppScreen.clientProfile);
              },
            ),
            const SizedBox(height: Spacing.regular),
            GestureDetector(
              onTap: () => modalController.closeModal(),
              child: Row(
                children: [
                  SvgPicture.asset(IconPath.logout, color: Get.theme.colorScheme.primary),
                  const SizedBox(width: Spacing.regular),
                  Text('Logout', style: Get.theme.textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget box({String? iconPath, String? title, bool? subsection, bool? noBackground, Function()? onTap}) {
  return Container(
    decoration: BoxDecoration(
      color: noBackground == true ? null : const Color(0xff4A514C),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(subsection == true ? Spacing.compact : Spacing.regular),
          child: Row(
            children: [
              if (iconPath != null)
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(iconPath, color: Get.theme.colorScheme.primary),
                ),
              if (subsection == true) const Spacer(flex: 1),
              const SizedBox(width: Spacing.regular),
              Expanded(
                flex: 9,
                child: Text(title ?? '', style: Get.theme.textTheme.bodyText1),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
