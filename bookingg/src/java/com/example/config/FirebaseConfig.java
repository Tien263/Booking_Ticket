package com.example.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import jakarta.servlet.ServletContext;
import java.io.FileInputStream;
import java.io.IOException;

public class FirebaseConfig {
    public static void initFirebase(ServletContext context) {
        try {
            String filePath = context.getRealPath("/WEB-INF/busgootp-firebase-adminsdk-fbsvc-8a3852934e.json");
            FileInputStream serviceAccount = new FileInputStream(filePath);

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
                System.out.println("Firebase đã khởi tạo thành công!");
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi khởi tạo Firebase: " + e.getMessage());
        }
    }
}