// import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
// import 'package:browncart_user/view/splash/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//             apiKey: "AIzaSyDi3JpZlkBxd0VgzZFoAPPZ3glb4k_VDF8",
//             authDomain: "browncart-user.firebaseapp.com",
//             projectId: "browncart-user",
//             storageBucket: "browncart-user.appspot.com",
//             messagingSenderId: "216298271007",
//             appId: "1:216298271007:web:ee4cd8d24ef4fe59a0402a",
//             measurementId: "G-8GTRSFY2KB"));
//   } else {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//       apiKey: "AIzaSyDi3JpZlkBxd0VgzZFoAPPZ3glb4k_VDF8",
//       projectId: "browncart-user",
//       storageBucket: "browncart-user.appspot.com",
//       messagingSenderId: "216298271007",
//       appId: "1:216298271007:web:ee4cd8d24ef4fe59a0402a",
//     ));
//   }

//   runApp(const MyApp());
// }

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => AuthBloc()),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'browncart',
//         home: SplashScreen(),
//       ),
//     );
//   }
// }
import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
import 'package:browncart_user/controller/cart_bloc/cart_bloc.dart';
import 'package:browncart_user/controller/cart_bloc/cart_event.dart';
import 'package:browncart_user/view/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDi3JpZlkBxd0VgzZFoAPPZ3glb4k_VDF8",
            authDomain: "browncart-user.firebaseapp.com",
            projectId: "browncart-user",
            storageBucket: "browncart-user.appspot.com",
            messagingSenderId: "216298271007",
            appId: "1:216298271007:web:ee4cd8d24ef4fe59a0402a",
            measurementId: "G-8GTRSFY2KB"));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDi3JpZlkBxd0VgzZFoAPPZ3glb4k_VDF8",
      projectId: "browncart-user",
      storageBucket: "browncart-user.appspot.com",
      messagingSenderId: "216298271007",
      appId: "1:216298271007:web:ee4cd8d24ef4fe59a0402a",
    ));
  }

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(
          create: (context) => CartBloc(FirebaseAuth.instance.currentUser!.email!)
            ..add(LoadCart()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'browncart',
        home: SplashScreen(),
      ),
    );
  }
}

