import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/usage/model/model_usage.dart';

class AddUsageArticleCard extends StatelessWidget {
  const AddUsageArticleCard({super.key, required this.artikel});

  final UsageArtikel artikel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.r),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 85,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Sizes.xs)),
            ),
            child: Image.network(APIPath.assetId(artikel.idAsset)),
          ),
        ],
      ),
    );
  }
}
