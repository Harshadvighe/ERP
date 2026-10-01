import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/app_card.dart';
import 'auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController(text: 'admin@company-erp.com');
  final _passwordController = TextEditingController(text: 'EnterprisePass2026!');
  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    ref.read(authProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: AppSpacing.pLg,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: AppCard(
              padding: AppSpacing.pXl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Brand Logo Header
                  Center(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: AppRadius.rMd,
                        boxShadow: [AppColors.shadowMd],
                      ),
                      child: const Icon(
                        Icons.precision_manufacturing_rounded,
                        color: AppColors.textInverse,
                        size: 32,
                      ),
                    ),
                  ),
                  AppSpacing.gapMd,
                  Text(
                    'COMPANY ERP',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.headingLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    'Enterprise Industrial Operations Platform',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  AppSpacing.gapLg,

                  // Demo Notice Pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: AppRadius.rSm,
                      border: Border.all(color: AppColors.primaryBorder),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, size: 16, color: AppColors.primaryDark),
                        AppSpacing.gapSm,
                        Expanded(
                          child: Text(
                            'UI Prototype Phase: Pre-filled with interactive demo credentials.',
                            style: AppTextTheme.labelSmall.copyWith(color: AppColors.primaryDark),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.gapLg,

                  // Email
                  AppTextField(
                    label: 'Email Address',
                    hint: 'name@company.com',
                    controller: _emailController,
                    prefixIcon: const Icon(Icons.email_outlined, size: 18, color: AppColors.textSecondary),
                  ),
                  AppSpacing.gapMd,

                  // Password
                  AppTextField(
                    label: 'Password',
                    hint: '••••••••••••',
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    prefixIcon: const Icon(Icons.lock_outline, size: 18, color: AppColors.textSecondary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        size: 18,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  AppSpacing.gapSm,

                  // Remember Me & Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (val) => setState(() => _rememberMe = val ?? true),
                          ),
                          const SizedBox(width: 4),
                          Text('Remember me', style: AppTextTheme.bodySmall),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: AppTextTheme.labelSmall.copyWith(color: AppColors.primaryDark),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.gapMd,

                  // Sign In Button
                  AppButton(
                    label: 'Sign In to ERP Portal',
                    icon: Icons.login_rounded,
                    isLoading: authState.isLoading,
                    isFullWidth: true,
                    onPressed: _handleLogin,
                  ),
                  AppSpacing.gapMd,

                  // Quick Demo Roles Fill
                  OutlinedButton.icon(
                    onPressed: () {
                      _emailController.text = 'operator@company-erp.com';
                      _passwordController.text = 'Operator2026!';
                      _handleLogin();
                    },
                    icon: const Icon(Icons.badge_outlined, size: 16),
                    label: const Text('Quick Launch as Plant Operator'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
