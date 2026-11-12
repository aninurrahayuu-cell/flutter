import 'package:flutter/material.dart';
import '../data/ticket_data.dart';
import '../utils/currency_format.dart';
import 'ticket_page.dart';

class ReceiptPage extends StatelessWidget {
  final String name;
  final String phone;
  final List<int> quantities;
  final int total;

  const ReceiptPage({
    super.key,
    required this.name,
    required this.phone,
    required this.quantities,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    String transactionId =
        'ST-${DateTime.now().millisecondsSinceEpoch}';

    int totalTickets =
        quantities.fold(0, (sum, quantity) => sum + quantity);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF102A43),
        foregroundColor: Colors.white,
        title: const Text('Bukti Pembayaran'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16845B).withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Color(0xFF16845B),
                      size: 55,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Pembayaran Berhasil!',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF102A43),
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Terima kasih telah membeli tiket.',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 22),

                  const Divider(),

                  const SizedBox(height: 10),

                  _infoRow('ID Transaksi', transactionId),
                  _infoRow('Nama Pemesan', name),
                  _infoRow('Nomor HP', phone),

                  const SizedBox(height: 15),

                  const Divider(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Pertandingan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  _infoRow('Pertandingan', 'Persib vs Rival FC'),
                  _infoRow('Tanggal', '22 November 2026'),
                  _infoRow('Stadion', 'GBLA'),

                  const SizedBox(height: 15),

                  const Divider(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Tiket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...List.generate(tickets.length, (index) {
                    if (quantities[index] == 0) {
                      return const SizedBox.shrink();
                    }

                    int subtotal =
                        (tickets[index]['price'] as int) *
                            quantities[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${tickets[index]['name']} x${quantities[index]}',
                            ),
                          ),
                          Text(
                            rupiah(subtotal),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const Divider(),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Tiket'),
                      Text('$totalTickets tiket'),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        rupiah(total),
                        style: const TextStyle(
                          color: Color(0xFF1769AA),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16845B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified,
                          color: Color(0xFF16845B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'TRANSAKSI BERHASIL',
                          style: TextStyle(
                            color: Color(0xFF16845B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TicketPage(),
                          ),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF102A43),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Kembali ke Halaman Tiket'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}