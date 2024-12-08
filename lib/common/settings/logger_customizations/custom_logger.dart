import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_log_output.dart';
import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_log_printer.dart';
import 'package:logger/logger.dart';

class CustomLogger extends Logger {
  final String className;

  CustomLogger({required this.className})
      : super(
          output: CustomLogOutput(),
          printer: CustomLogPrinter(className: className),
        );
}
