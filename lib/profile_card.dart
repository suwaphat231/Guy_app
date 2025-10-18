import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String phone;
  final String avatarUrl;
  final bool showDemoRibbon;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    this.showDemoRibbon = false,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // รูปโปรไฟล์กลม
            CircleAvatar(
              radius: 36,
              backgroundImage: const AssetImage('assets/images/Guy.jpg'),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 12),
            // ชื่อ
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            // ตำแหน่งงาน
            Text(
              role,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.black.withOpacity(0.06)),
            const SizedBox(height: 12),

            _InfoRow(
              icon: Icons.mail_rounded,
              iconColor: const Color(0xFF2E90E5),
              text: email,
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.phone_rounded,
              iconColor: const Color(0xFF22C55E),
              text: phone,
            ),
          ],
        ),
      ),
    );

    // เพิ่มริบบิ้นมุมบนแบบ "DEMO" ให้คล้ายรูป
    if (!showDemoRibbon) return card;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        card,
        Positioned(
          right: -6,
          top: -6,
          child: Transform.rotate(
            angle: 0.79, // ~45 องศา
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE11D48),
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                'DEMO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
