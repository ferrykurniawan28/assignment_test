import 'package:assignment_test/features/home/presentation/home.dart';
import 'package:assignment_test/features/portofoliio/presentation/cubit/portofolio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<PortofolioCubit>(
              create: (context) => PortofolioCubit(),
            ),
          ],
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
