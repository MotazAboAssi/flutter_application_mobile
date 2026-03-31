import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// CachedNetworkImage image1(String url) {
//   return CachedNetworkImage(
//     imageUrl: url,
//     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//     errorWidget: (context, url, error) => Text("failed load image try image"),
//   );
// }

// CachedNetworkImage image2(String url) {
//   return CachedNetworkImage(
//     imageUrl: url,
//     imageBuilder: (context, imageProvider) => Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: imageProvider,
//           colorFilter: ColorFilter.mode(
//             Colors.transparent,
//             BlendMode.colorBurn,
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//     errorWidget: (context, url, error) => Icon(Icons.error),
//   );
// }

CachedNetworkImage loadNetworkImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    progressIndicatorBuilder: (context, url, progress) =>
        Center(child: CircularProgressIndicator(value: progress.progress)),
    errorWidget: (context, url, error) => Text("failed load image try again"),
  );
}
