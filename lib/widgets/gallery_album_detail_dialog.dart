import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/api/get.dart';
import 'package:kelas_mengaji_saderi/models/gallery_album_model.dart';
import 'package:kelas_mengaji_saderi/service/gallery_service.dart';
import 'package:kelas_mengaji_saderi/widgets/fullscreen_image_viewer.dart';

const _purple = Color(0xFF3D0E63);

/// Call this from `onView` in the gallery list — matches the "Lihat" popup UI.
Future<void> showGalleryAlbumDetailDialog(
  BuildContext context, {
  required int albumId,
  VoidCallback? onEdit,
  VoidCallback? onChanged,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (context) => GalleryAlbumDetailDialog(
      albumId: albumId,
      onEdit: onEdit,
      onChanged: onChanged,
    ),
  );
}

class GalleryAlbumDetailDialog extends StatefulWidget {
  final int albumId;
  final VoidCallback? onEdit;
  final VoidCallback? onChanged; // fires after an image is deleted

  const GalleryAlbumDetailDialog({
    super.key,
    required this.albumId,
    this.onEdit,
    this.onChanged,
  });

  @override
  State<GalleryAlbumDetailDialog> createState() => _GalleryAlbumDetailDialogState();
}

class _GalleryAlbumDetailDialogState extends State<GalleryAlbumDetailDialog> {
  final _service = GalleryService();

  bool _loading = true;
  String? _error;
  GalleryAlbumDetail? _detail;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final detail = await _service.fetchAlbumDetail(widget.albumId);
      setState(() => _detail = detail);
    } catch (e) {
      setState(() => _error = 'Gagal memuat butiran album.');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _confirmDeleteImage(GalleryAlbumImage image) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Padam Gambar?'),
        content: const Text('Gambar ini akan dipadam secara kekal daripada album.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Padam', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true || _detail == null) return;

  }

  void _openViewer(int index) {
    if (_detail == null) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => FullscreenImageViewer(
          images: _detail!.images,
          initialIndex: index,
        ),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final dialogWidth = size.width > 700 ? 620.0 : size.width - 32;
  final dialogHeight = size.height > 700 ? 640.0 : size.height - 80;

  return Dialog(
    insetPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 40,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.white,
    child: SizedBox(
      width: dialogWidth,
      height: dialogHeight,
      child: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: _purple,
              ),
            )
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              : _buildContent(),
    ),
  );
}

  Widget _buildContent() {
  final detail = _detail!;

  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // =========================================================
      // HEADER
      // =========================================================
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 12, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF1E9FB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Aktiviti Kelas',
                style: TextStyle(
                  color: _purple,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                ),
              ),
            ),

            const Spacer(),

            Icon(
              Icons.calendar_today_rounded,
              size: 15,
              color: Colors.grey,
            ),

            const SizedBox(width: 6),

            Flexible(
              child: Text(
                detail.formattedDate,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13.5,
                ),
              ),
            ),

            const SizedBox(width: 4),

            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              tooltip: 'Tutup',
            ),
          ],
        ),
      ),

      // =========================================================
      // TITLE
      // =========================================================
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
        child: Text(
          detail.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: _purple,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
      ),

      // =========================================================
      // DESCRIPTION
      // =========================================================
      if (detail.description.isNotEmpty)
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Text(
            detail.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14.5,
              height: 1.4,
            ),
          ),
        ),

      const Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Divider(height: 1),
      ),

      // =========================================================
      // PHOTO HEADER
      // =========================================================
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              size: 18,
              color: _purple,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                'Koleksi Foto (${detail.images.length} Gambar)',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Flexible(
              child: Text(
                'Klik gambar untuk zoom & slaid paparan',
                maxLines: 2,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12.5,
                ),
              ),
            ),
          ],
        ),
      ),

      // =========================================================
      // IMAGE GRID
      // =========================================================
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: detail.images.isEmpty
              ? Center(
                  child: Text(
                    'Tiada gambar dalam album ini.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  itemCount: detail.images.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (context, index) {
                    final image = detail.images[index];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // IMAGE
                          GestureDetector(
                            onTap: () => _openViewer(index),
                            child: Image.network(
                              image.imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }

                                return Container(
                                  color: Colors.grey.shade100,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: _purple,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (_, __, ___) {
                                return Container(
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image_outlined,
                                      color: Colors.grey,
                                      size: 32,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // DELETE BUTTON
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => _confirmDeleteImage(image),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEF6558),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),

      // =========================================================
      // FOOTER
      // =========================================================
      Container(
        padding: const EdgeInsets.fromLTRB(
          20,
          12,
          20,
          20,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton.icon(
              onPressed: widget.onEdit,
              icon: const Icon(
                Icons.edit_outlined,
                size: 18,
              ),
              label: const Text('Sunting Album'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(width: 12),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Tutup'),
            ),
          ],
        ),
      ),
    ],
  );
}
}