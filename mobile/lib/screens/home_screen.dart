import 'package:flutter/material.dart';

import '../config.dart';
import '../services/api_client.dart';

/// 1. hafta: uygulamanın iskeleti. API'ye bağlanıp bağlanamadığını gösterir.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _api = ApiClient();
  bool? _serverUp;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    setState(() => _serverUp = null);
    final up = await _api.isServerUp();
    if (mounted) setState(() => _serverUp = up);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Pushly')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bugünkü hedef', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('0 / 50', style: theme.textTheme.displayMedium),
              const SizedBox(height: 32),
              _ServerStatus(up: _serverUp),
              const SizedBox(height: 8),
              Text(apiUrl, style: theme.textTheme.bodySmall),
              const SizedBox(height: 16),
              OutlinedButton(onPressed: _check, child: const Text('Tekrar dene')),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServerStatus extends StatelessWidget {
  const _ServerStatus({required this.up});

  final bool? up;

  @override
  Widget build(BuildContext context) {
    if (up == null) return const CircularProgressIndicator();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(up! ? Icons.check_circle : Icons.error, color: up! ? Colors.green : Colors.red),
        const SizedBox(width: 8),
        Text(up! ? 'Sunucuya bağlı' : 'Sunucuya ulaşılamadı'),
      ],
    );
  }
}
