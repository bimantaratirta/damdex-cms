import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/settings_controller.dart';
import 'settings_profile_field.dart';
import 'settings_profile_input_field.dart';

class SettingsContent extends GetView<SettingsController> {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final settings = controller.settings.value;
        final profile = controller.profile.value;
        final isOnEdit = controller.isOnEdit.value;
        final isError = controller.isError.value;
        if (settings == null || profile == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "Artikel",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              if (isOnEdit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      type: ButtonType.outlined,
                      onPressed: () {
                        controller.isError.value = false;
                        controller.isOnEdit.value = false;
                      },
                      fixedSize: const Size(100, 40),
                      child: const Text("Batal"),
                    ),
                    Gaps.horizontal.r,
                    AppButton(
                      type: ButtonType.elevated,
                      backgroundColor: AppColors.primary,
                      onPressed: controller.patch,
                      fixedSize: const Size(100, 40),
                      child: const Text("Simpan"),
                    ),
                  ],
                )
              else
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    type: ButtonType.elevated,
                    onPressed: () => controller.isOnEdit.value = true,
                    child: const Text("Edit Profil"),
                  ),
                ),
              Gaps.vertical.m,
              if (isError)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextBold(
                      text: "Data Tidak Valid!",
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    Gaps.vertical.m,
                  ],
                ),
              Gaps.vertical.r,
              Row(
                children: [
                  Flexible(
                    child: isOnEdit
                        ? SettingsProfileInputField(
                            controller: controller.namaC,
                            label: "Nama",
                            focusNode: controller.namaFN,
                            isObscure: false,
                          )
                        : SettingsProfileField(
                            title: "Nama",
                            desc: profile.nama ?? "-",
                          ),
                  ),
                  Gaps.horizontal.l,
                  Flexible(
                    child: isOnEdit
                        ? SettingsProfileInputField(
                            controller: controller.unameC,
                            label: "Username",
                            focusNode: controller.unameFN,
                            isObscure: false,
                          )
                        : SettingsProfileField(
                            title: "Username",
                            desc: profile.username ?? "-",
                          ),
                  ),
                ],
              ),
              Gaps.vertical.m,
              if (isOnEdit)
                Row(
                  children: [
                    Flexible(
                      child: SettingsProfileInputField(
                        controller: controller.passC,
                        label: "Password Sekarang",
                        focusNode: controller.passFN,
                        isObscure: true,
                      ),
                    ),
                    Gaps.horizontal.l,
                    Flexible(
                      child: SettingsProfileInputField(
                        controller: controller.conPassC,
                        label: "Password Baru",
                        focusNode: controller.conPassFN,
                        isObscure: true,
                      ),
                    ),
                  ],
                ),
              Gaps.vertical.m,
            ],
          ),
        );
      }),
    );
  }
}
