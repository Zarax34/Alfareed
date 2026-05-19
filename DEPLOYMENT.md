
# Deployment Guide for Al-Farid Honey App

## 1. Backend Deployment (Node.js & PostgreSQL)
- **Platform**: Railway.app or DigitalOcean App Platform.
- **Database**: Managed PostgreSQL.
- **Environment Variables**: 
  - `DATABASE_URL`: Connection string for PostgreSQL.
  - `JWT_SECRET`: Secure random string.
  - `CLOUDINARY_URL`: For storing product and receipt images.
  - `FIREBASE_SERVICE_ACCOUNT`: For FCM notifications.
- **Command**: `npm install && npm run build && npm start`

## 2. Web Deployment (Next.js)
- **Platform**: Vercel.
- **Configuration**: Point the `API_BASE_URL` environment variable to the deployed backend URL.

## 3. Android Deployment (Flutter)
- **Build**: `flutter build apk --release`
- **Firebase**: Link the Android app package name (e.g., `com.alfarid.honey`) to the Firebase Console.
- **Distribution**: Upload `.aab` to Google Play Console.

## 4. Final Verification Checklist
- [x] User Roles (Customer, Admin, Delivery) independently tested.
- [x] Payment screenshot upload and verification flow confirmed.
- [x] Store open/close logic verified.
- [x] Push notifications reaching all roles.
- [x] RTL Arabic layout consistency.
