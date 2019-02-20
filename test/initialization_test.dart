import 'package:flutter/material.dart';

void main() {
    /// Test de l'initialisation de l'application
    ///
    testWidgets('Figura initialize well and navigation is working', (WidgetTester tester) async {
        // Initialisation des variables
        final homeKey = Key('homePage');
        final workoutKey = Key('workoutPage');
        final exerciseKey = Key('exercisePage');
        
        // Build our app and trigger a frame.
        await tester.pumpWidget(Figura());
        
        // Verify that our application starts on home page
        expect(find.byKey(homeKey), findsOneWidget);
        
        // And that homePage is well initialized
        /*
        *
        *   What should we find on homePage ?
        *
        */
        
        // Tap the workout navigation bar item
        await tester.tap(find.text('Workout'));
        
        // Verify that our application navigates to workout page
        expect(find.byKey(workoutKey), findsOneWidget);
        
        // And that workoutPage is well initialized
        /*
        *
        *   What should we find on workoutPage ?
        *
        */
        
        // Tap the exercise navigation bar item
        await tester.tap(find.text('Exercise'));
        
        // Verify that our application navigates to exercise page
        expect(find.byKey(exerciseKey), findsOneWidget);
        
        // And that exercisePage is well initialized
        /*
        *
        *   What should we find on exercisePage ?
        *
        */
    });
}
