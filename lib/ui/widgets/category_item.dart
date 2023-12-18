import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CategoryItem extends StatelessWidget {
  final CategoryDM categoryDM;

  const CategoryItem({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      //  margin: EdgeInsets.all(1),
      child: Column(
        children: [
          Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(
              categoryDM.image ?? "",
            ),
          ),
          Spacer(),
          Text(
            categoryDM.name ?? "Unkown",
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}