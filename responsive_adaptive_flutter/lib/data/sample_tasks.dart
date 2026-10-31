import 'package:flutter/material.dart';
import '../models/task.dart';

const sampleTasks = <Task>[
  Task(
    title: 'Thiết kế giao diện',
    description: 'Hoàn thiện bố cục trang chủ ứng dụng',
    category: 'UI/UX',
    status: TaskStatus.inProgress,
    progress: 0.72,
    color: Color(0xFF536DFE),
    icon: Icons.design_services_outlined,
  ),
  Task(
    title: 'Xây dựng API',
    description: 'Tạo các endpoint quản lý dữ liệu',
    category: 'Backend',
    status: TaskStatus.completed,
    progress: 1,
    color: Color(0xFF16A085),
    icon: Icons.code,
  ),
  Task(
    title: 'Kiểm thử ứng dụng',
    description: 'Kiểm tra các luồng chức năng chính',
    category: 'Testing',
    status: TaskStatus.pending,
    progress: 0.18,
    color: Color(0xFFE39A28),
    icon: Icons.bug_report_outlined,
  ),
  Task(
    title: 'Viết tài liệu',
    description: 'Mô tả cài đặt và hướng dẫn sử dụng',
    category: 'Documentation',
    status: TaskStatus.inProgress,
    progress: 0.45,
    color: Color(0xFF8E5BD9),
    icon: Icons.description_outlined,
  ),
  Task(
    title: 'Tối ưu hiệu năng',
    description: 'Giảm thời gian tải và cải thiện trải nghiệm',
    category: 'Performance',
    status: TaskStatus.pending,
    progress: 0.1,
    color: Color(0xFFDB6575),
    icon: Icons.speed,
  ),
  Task(
    title: 'Phát hành bản demo',
    description: 'Chuẩn bị bản chạy thử đa nền tảng',
    category: 'Release',
    status: TaskStatus.completed,
    progress: 1,
    color: Color(0xFF2999B8),
    icon: Icons.rocket_launch_outlined,
  ),
];
