import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../constants/sizes.dart';
import '../../../theme/app_colors.dart';
import '../../shareds/widgets/text_bold.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailFeatureCard extends GetView<ProductDetailController> {
  const ProductDetailFeatureCard({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => controller.setSelectedFeature(i),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
            color: AppColors.primary,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                  text: "Nama Fitur",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          final isOpen = controller.selectedFeature.value == i;
          return isOpen
              ? Container(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: const HtmlWidget(
                    '''<article>
    			<p>DAMDEX adalah bahan pencampur semen (additive) yang menghasilkan pelapis, perekat, dan penambal tahan air dengan sifat-sifat unggul sehingga mampu melindungi bangunan dengan efisien dan efektif.</p>
    <p>DAMDEX tersedia dalam 4 ukuran:</p>
    <p><img src="../../assets/gallery/damdex_ukuran_botol.jpg" alt="" width="715" height="300"><br><br><span>Menggunakan DAMDEX memastikan bangunan tahan air, kuat, serta hemat waktu dan hemat biaya. Lihatlah video demonstrasi yang menunjukkan berbagai keistimewaan DAMDEX</span></p>			<br>
    			<h3>Kualitas Spesial DAMDEX</h3>
    			<dl class="arlist">
    								<dt class="act">
    					ANTI BOCOR DAN MENAHAN RESAPAN AIR				</dt>
    				<dd>
    					<p>DAMDEX&nbsp; bahkan dapat digunakan untuk melapis kolam agar tidak bocor ataupun merembes. Lihat bagaimana saringan air yang dilapis DAMDEX dapat menahan air dengan sempurna.</p>
    <p><img src="../../../assets/gallery/prd-art01.jpg" alt="" width="641" height="193"></p>
    <ul>
    <li>Melindungi cat di dinding dari kerusakan karena lembab.</li>
    <li>Melindungi tulangan besi dalam beton dari karat.</li>
    <li>Mencegah arus listrik mengalir akibat rembesan.</li>
    </ul>				</dd>
    								<dt>
    					TAHAN PANAS DAN CUACA				</dt>
    				<dd style="display: none;">
    					<p><span>Karena dicampur semen, lapisan waterproof DAMDEX kuat, tahan panas dan bahkan tahan bakar – tidak mudah rusak oleh sinar matahari atau tekanan air hujan.</span></p>
    <p><span><img src="https://api.makar.my.id/asset/d0de50bb-fdd3-49ee-a3bd-61b4273316ad" alt="" width="479" height="142"></span></p>				</dd>
    								<dt>
    					CEPAT KERING DAN MENGERAS DENGAN SEMPURNA				</dt>
    				<dd style="display: none;">
    					<p>DAMDEX membuat campuran semen menjadi jauh lebih cepat kering dan mengeras dengan sempurna.</p>
    <ul>
    <li>Pada lapisan anti air, bisa mengering 3 kali lebih cepat.</li>
    <li>Pada campuran beton, bisa mengering lebih cepat.</li>
    <li>Dapat menutup lubang kebocoran air dalam kurang dari semenit.</li>
    </ul>				</dd>
    								<dt>
    					DAPAT MEREKAT DALAM KONDISI BASAH DAN DI DALAM AIR				</dt>
    				<dd style="display: none;">
    					<p>DAMDEX memang bekerja pada kondisi basah dan mempunyai kemampuan rekat yang tinggi.&nbsp;</p>
    <ul>
    <li>Bisa merekat keramik lantai di bawah air (sehingga tidak perlu menguras).</li>
    <li>Mampu menambal kebocoran air yang masih mengalir.</li>
    <li>Bisa segera digunakan di musim hujan.</li>
    </ul>
    <p><img src="../../../assets/gallery/sifatistimewa_05_mix.jpg" alt="" width="479" height="142"></p>
    <p>&nbsp;</p>				</dd>
    								<dt>
    					KUAT DAN KERAS				</dt>
    				<dd style="display: none;">
    					<p>Semua hasil semen menjadi lebih kuat dan keras jika dicampur DAMDEX</p>
    <ul>
    <li>Plesteran semen menjadi tiga kali lebih kuat.</li>
    <li>Daya tekan beton yang dicampur DAMDEX menjadi sampai dengan 35% lebih kuat.</li>
    <li>Grouting nat keramik lebih tahan gores dan warna tidak cepat berubah.</li>
    </ul>				</dd>
    								<dt>
    					DAMDEX MULTIFUNGSI				</dt>
    				<dd style="display: none;">
    					<p>Campuran DAMDEX dengan semen dapat disesuaikan bentuknya untuk&nbsp;memenuhi berbagai kebutuhan.&nbsp;</p>
    <p>- Campuran cair dapat melapis dan meresap ke dalam retakan.<br>- Campuran kental dapat merekat keramik dengan kuat.<br>- Campuran padat dapat menambal lubang ataupun membuat beton tahan air.</p>				</dd>
    								<dt>
    					JAUH LEBIH HEMAT				</dt>
    				<dd style="display: none;">
    					<ul>
    <li>Karena dicampur semen: dapat melapis tiga kali lebih luas dari pelapis waterproof biasa.</li>
    <li>Karena kering lebih cepat: Pengerjaan lebih cepat dan hemat waktu.</li>
    <li>Karena lebih kuat dan tahan lama: Mengurangi biaya perbaikan dalam jangka&nbsp;&nbsp;panjang.</li>
    </ul>
    <p>Menggunakan DAMDEX memastikan bangunan tahan air, kuat, serta hemat waktu dan hemat biaya. Lihatlah video demonstrasi yang menunjukkan berbagai keistimewaan DAMDEX.</p>
    <p><iframe src="http://www.youtube.com/embed/L86uE5yAnL0" frameborder="0" width="425" height="350"></iframe></p>				</dd>
    							</dl>
    		</article>''',
                    renderMode: RenderMode.column,
                    textStyle: TextStyle(fontSize: 14),
                  ),
                )
              : const SizedBox();
        })
      ],
    );
  }
}
