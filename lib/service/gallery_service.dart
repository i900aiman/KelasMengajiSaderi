import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kelas_mengaji_saderi/models/gallery_album_model.dart';



// Future<GalleryAlbumDetail> fetchAlbumDetail(int id) async {
//   final uri = Uri.parse('$_baseUrl/albums/$id');
//   final response = await http.get(uri);

//   if (response.statusCode == 200) {
//     return GalleryAlbumDetail.fromJson(
//       jsonDecode(response.body) as Map<String, dynamic>,
//     );
//   }
//   throw Exception('Gagal memuat butiran album (${response.statusCode})');
// }

// // Assumption: endpoint ikut pattern REST biasa. Betulkan path ni kalau
// // backend guna route lain untuk padam gambar dalam album.
// Future<void> deleteImage(int albumId, int imageId) async {
//   final uri = Uri.parse('$_baseUrl/albums/$albumId/images/$imageId');
//   final response = await http.delete(uri);

//   if (response.statusCode != 200 && response.statusCode != 204) {
//     throw Exception('Gagal padam gambar (${response.statusCode})');
//   }
// }