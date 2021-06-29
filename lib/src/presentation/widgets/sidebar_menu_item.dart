import 'package:flutter/material.dart';

class SideBarMenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function() onPressed;

  const SideBarMenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.isActive = false,
      required this.onPressed})
      : super(key: key);

  @override
  _SideBarMenuItemState createState() => _SideBarMenuItemState();
}

class _SideBarMenuItemState extends State<SideBarMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      color: isHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: Material(
        color: widget.isActive ?  Colors.white.withOpacity(0.1) : Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Row(             
                children: [
                  Icon(widget.icon, color: Colors.white.withOpacity(0.3)),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
