import 'package:flutter/material.dart';
import '../data/ticket_data.dart';
import '../utils/currency_format.dart';
import 'detail_page.dart';

const Color navy = Color(0xFF102A43);
const Color blue = Color(0xFF1769AA);
const Color gold = Color(0xFFFFC857);
const Color background = Color(0xFFF4F7FA);

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  IconData getTicketIcon(String icon) {
    switch (icon) {
      case 'vip':
        return Icons.workspace_premium;
      case 'west':
        return Icons.stadium;
      case 'east':
        return Icons.groups;
      default:
        return Icons.confirmation_number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: const Text(
          'PERSIB TICKET',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = constraints.maxWidth > 650 ? 2 : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [navy, blue],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MATCH DAY',
                            style: TextStyle(
                              color: gold,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'PERSIB VS RIVAL FC',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: gold,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '22 November 2026',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: gold,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Stadion Gelora Bandung Lautan Api',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Pilih Tiket Pertandingan',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Pilih kategori tiket sesuai keinginanmu.',
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 15),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tickets.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 190,
                      ),
                      itemBuilder: (context, index) {
                        final ticket = tickets[index];

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: gold.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      getTicketIcon(ticket['icon']),
                                      color: navy,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.confirmation_number,
                                    color: gold,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                ticket['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: navy,
                                ),
                              ),
                              Text(
                                ticket['description'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      rupiah(ticket['price']),
                                      style: const TextStyle(
                                        color: blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPage(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: navy,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}