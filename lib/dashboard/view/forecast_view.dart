import 'dart:ui';
import 'package:flutter/material.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ForecastView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: '30',
                            style: TextStyle(fontSize: 72),
                          ),
                          TextSpan(
                            text: 'panels',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '2 LG360N1C-N5 360W',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.power_settings_new,
                        color: Colors.black87,
                        size: 32,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.restart_alt,
                          color: Colors.black87, size: 32),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/panels.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 180),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 24,
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '8 kWh',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Between 10:00 - 12:00 today',
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.orangeAccent,
                                                foregroundColor: Colors.black87,
                                                textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 24,
                                                  vertical: 2,
                                                ),
                                              ),
                                              child: const Text(
                                                  'Check efficiency'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: LinearProgressIndicator(
                                                value: 0.9,
                                                backgroundColor: Colors
                                                    .grey.shade300
                                                    .withOpacity(
                                                  0.6,
                                                ),
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                minHeight: 12,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            const Text(
                                              '90%',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.power_settings_new, color: Colors.orange),
              Container(
                height: 100,
                width: 150,
                color: Colors.grey.shade200,
                child: Center(
                    child: Icon(Icons.image, size: 40, color: Colors.grey)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.all(16.0),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(12),
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Colors.grey.shade300,
          //                 blurRadius: 10,
          //                 offset: Offset(0, 5)),
          //           ],
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             const Text('8 kWh',
          //                 style: TextStyle(
          //                     fontSize: 24, fontWeight: FontWeight.bold)),
          //             const SizedBox(height: 4),
          //             const Text('Generate electricity',
          //                 style: TextStyle(color: Colors.grey)),
          //             const SizedBox(height: 16),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Expanded(
          //                   child: LinearProgressIndicator(
          //                     value: 0.9,
          //                     backgroundColor: Colors.grey.shade300,
          //                     color: Colors.orange,
          //                   ),
          //                 ),
          //                 const SizedBox(width: 16),
          //                 ElevatedButton(
          //                   onPressed: () {},
          //                   style: ElevatedButton.styleFrom(
          //                     backgroundColor: Colors.orange,
          //                     shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(12)),
          //                   ),
          //                   child: const Text('Sell Electricity'),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 16),
          //       Row(
          //         children: [
          //           Expanded(
          //             child: Container(
          //               padding: const EdgeInsets.all(16.0),
          //               decoration: BoxDecoration(
          //                 color: Colors.orange.shade100,
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //               child: Column(
          //                 children: [
          //                   const Text('21200 USA',
          //                       style: TextStyle(
          //                           fontSize: 20, fontWeight: FontWeight.bold)),
          //                   const SizedBox(height: 4),
          //                   const Text('Current Income',
          //                       style: TextStyle(color: Colors.grey)),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 16),
          //           Expanded(
          //             child: Container(
          //               padding: const EdgeInsets.all(16.0),
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(12),
          //                 boxShadow: [
          //                   BoxShadow(
          //                       color: Colors.grey.shade300,
          //                       blurRadius: 10,
          //                       offset: Offset(0, 5)),
          //                 ],
          //               ),
          //               child: const Column(
          //                 children: [
          //                   const Text('120 KW/H',
          //                       style: TextStyle(
          //                           fontSize: 20, fontWeight: FontWeight.bold)),
          //                   const SizedBox(height: 4),
          //                   const Text('Time usage',
          //                       style: TextStyle(color: Colors.grey)),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
