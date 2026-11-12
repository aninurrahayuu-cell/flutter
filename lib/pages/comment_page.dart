import 'package:flutter/material.dart';

import '../models/comment.dart'; // File model kamu (class COMMENTS)
import '../services/comment_service.dart'; // Path mengarah ke comment_service.dart
import 'comment_detail_page.dart';

class CommentPage extends StatefulWidget {
  final int postId; // ID post untuk mengambil komentar terkait

  const CommentPage({super.key, required this.postId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  // Menggunakan CommentService (sesuaikan nama class di dalam file comment_service.dart jika berbeda, misal ApiComment)
  final CommentService _api = CommentService();
  late Future<List<COMMENTS>> _futureComments;

  @override
  void initState() {
    super.initState();
    _futureComments = _api.fetchComments(widget.postId); 
  }

  void _reload() {
    setState(() {
      _futureComments = _api.fetchComments(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Komentar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
          ),
        ],
      ),
      body: FutureBuilder<List<COMMENTS>>(
        future: _futureComments,
        builder: (context, snapshot) {
          // Kondisi 1: error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Terjadi kesalahan:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _reload,
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Kondisi 2: masih loading
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Kondisi 3: data siap
          final comments = snapshot.data!;

          if (comments.isEmpty) {
            return const Center(child: Text('Belum ada komentar'));
          }

          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, i) {
              final comment = comments[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${comment.id}'),
                  ),
                  title: Text(
                    comment.name ?? 'Tanpa Nama',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    comment.body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentDetailPage(comment: comment),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}