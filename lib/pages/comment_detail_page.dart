import 'package:flutter/material.dart';

import '../models/comment.dart'; // Sesuaikan path import model kamu

class CommentDetailPage extends StatelessWidget {
  final COMMENTS comment;

  const CommentDetailPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Komentar #${comment.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name ?? 'Tanpa Nama',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              comment.email ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Text(comment.body ?? ''),
            const SizedBox(height: 24),
            Text(
              'Terkait post #${comment.postId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}