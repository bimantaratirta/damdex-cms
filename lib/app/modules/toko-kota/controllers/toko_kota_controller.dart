import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/toko/data/delete_toko.dart';
import '../../../data/api/toko/data/get_toko_kota.dart';
import '../../../data/api/toko/data/patch_toko.dart';
import '../../../data/api/toko/data/post_toko.dart';
import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../theme/app_colors.dart';
import '../../toko/controllers/toko_controller.dart';

class TokoKotaController extends GetxController {
  final Rx<ModelTokoKota?> tokoKota = Rx<ModelTokoKota?>(null);
  Rx<NewToko> newToko = Rx<NewToko>(NewToko());
  final ScrollController scrollController = ScrollController();

  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    update();
    final response = await getTokoKota(Get.arguments ?? "null");
    if (response.data != null) {
      if (response.data?.idProvinsi == null || response.data?.kota == null) {
        Get.offNamed(Routes.TOKO);
      } else {
        tokoKota.value = response.data;
        newToko.value = NewToko(idKota: int.parse(response.data?.idKota ?? "0"));
      }
    } else {
      Get.offNamed(Routes.TOKO);
    }
    isLoading.value = false;
    update();
    super.onInit();
  }

  Future<void> add() async {
    isError.value = false;
    isLoading.value = true;
    update();
    final response = await postToko(newToko.value.toJson());
    if (response.data != null) {
      newToko.value = NewToko();
      Get.back();
      await onInit();
    } else {
      isError.value = true;
    }
    isLoading.value = false;
    update();
  }

  Future<void> edit(Toko toko) async {
    isLoading.value = true;
    update();
    final response = await patchToko(toko.id ?? "", {
      "nama": toko.nama,
      "detail": toko.detail,
      "noHp": toko.noHp,
      "tipe": toko.tipe,
      "idKota": toko.idKota,
    });
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      Get.back();
      isError.value = false;
      await onInit();
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
    isLoading.value = false;
    update();
  }

  Future<void> delete(Toko toko) async {
    Get.dialog(AlertDialog(
      title: Text("Hapus Toko ${toko.nama}?"),
      actions: [
        GetBuilder<TokoKotaController>(builder: (controller) {
          final isLoading = controller.isLoading.value;
          final state = isLoading ? ButtonState.loading : ButtonState.enable;
          return AppButton(
            state: state,
            type: ButtonType.outlined,
            onPressed: Get.back,
            fixedSize: const Size(100, 40),
            child: const Text("Batal"),
          );
        }),
        GetBuilder<TokoKotaController>(builder: (controller) {
          final isLoading = controller.isLoading.value;
          final state = isLoading ? ButtonState.loading : ButtonState.enable;
          return AppButton(
            state: state,
            type: ButtonType.elevated,
            backgroundColor: AppColors.red,
            onPressed: () async {
              this.isLoading.value = true;
              update();
              await deleteToko(toko.id ?? "");
              Get.back();
              await onInit();
              this.isLoading.value = false;
              update();
            },
            fixedSize: const Size(100, 40),
            child: const Text("Hapus"),
          );
        }),
      ],
    ));
  }
}
