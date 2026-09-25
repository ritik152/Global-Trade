import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/responsive/responsive_layout.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      // Simulate network request
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isSubmitting = false);
          _formKey.currentState!.reset();
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Thank you! Your inquiry has been sent successfully.'),
              backgroundColor: AppColors.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 120 : 80,
          ),
          color: AppColors.primary,
          child: Column(
            children: [
              Text(
                'CONTACT US',
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fade().slideY(),
              const SizedBox(height: 16),
              Text(
                'Get in touch for global trade opportunities.',
                style: TextStyle(
                  fontSize: isDesktop ? 20 : 18,
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 200.ms).slideY(),
            ],
          ),
        ),

        // Main Content
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 100 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Info
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s Connect',
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'We are here to answer any questions you may have about our products, services, or partnership opportunities.',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 48),
                        
                        _ContactInfoItem(
                          icon: Icons.email_outlined,
                          title: 'Email Us',
                          value: CompanyConfig.email,
                        ),
                        const SizedBox(height: 32),
                        
                        _ContactInfoItem(
                          icon: Icons.phone_outlined,
                          title: 'Call Us',
                          value: CompanyConfig.phone,
                        ),
                        const SizedBox(height: 32),
                        
                        _ContactInfoItem(
                          icon: Icons.location_on_outlined,
                          title: 'Visit Us',
                          value: CompanyConfig.address,
                        ),
                      ],
                    ).animate().fade().slideX(begin: -0.1),
                  ),
                  
                  if (isDesktop) const SizedBox(width: 80) else const SizedBox(height: 60),
                  
                  // Form
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: Container(
                      padding: EdgeInsets.all(isDesktop ? 40 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Business Enquiry',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 32),
                            
                            // Name
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Full Name *',
                                prefixIcon: Icon(Icons.person_outline),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Email
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email Address *',
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Phone and Country
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Phone Number',
                                      prefixIcon: Icon(Icons.phone_outlined),
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Country',
                                      prefixIcon: Icon(Icons.public),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            // Company Name
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Company Name',
                                prefixIcon: Icon(Icons.business_outlined),
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            // Message
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Your Requirement / Message *',
                                alignLabelWithHint: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(bottom: 80),
                                  child: Icon(Icons.message_outlined),
                                ),
                              ),
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 32),
                            
                            // Submit Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: _isSubmitting ? null : _submitForm,
                                child: _isSubmitting
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(
                                        'Send Inquiry',
                                        style: TextStyle(fontSize: 16),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate().fade().slideX(begin: 0.1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 28),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
