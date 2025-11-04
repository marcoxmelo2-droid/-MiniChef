import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';
import 'package:mini_cheff/src/features/scanner/presentation/widgets/scan_result_bottom_sheet.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  static const routeName = '/scanner';

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _isProcessing = false;

  void _onScan() async {
    setState(() => _isProcessing = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isProcessing = false);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const ScanResultBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear prato'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: const Center(
              child: Icon(Icons.photo_camera_front, size: 120, color: Colors.white54),
            ),
          ),
          Positioned(
            bottom: NutriMaeTokens.space24,
            left: NutriMaeTokens.space24,
            right: NutriMaeTokens.space24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: NutriMaeTokens.space16,
                    vertical: NutriMaeTokens.space12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(NutriMaeTokens.radiusLg),
                  ),
                  child: const Text(
                    'Aproxime a câmera e mantenha o prato visível.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: NutriMaeTokens.space16),
                FloatingActionButton.large(
                  heroTag: 'scan_button',
                  onPressed: _isProcessing ? null : _onScan,
                  child: _isProcessing
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.center_focus_strong, size: 48),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
