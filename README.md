<div align="center">

# 🍽️ FOOD MY TYPE

**รู้จักตัวตนของคุณ ผ่านจานโปรด**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Vercel](https://img.shields.io/badge/Vercel-Deployed-000000?style=for-the-badge&logo=vercel&logoColor=white)](https://vercel.com)

</div>

## 📝 ข้อมูลโครงการวิจัย (Research Project Information)

| หัวข้อ | รายละเอียด |
| :--- | :--- |
| **หัวข้อโครงการวิจัย** | การออกแบบเกมบนเว็บไซต์ให้ความรู้เกี่ยวกับการบริโภคอาหารสำหรับวัยรุ่น อายุ 18-22ปี |
| **ผู้จัดทำ** | นางสาวพรหมสิริ เจริญทรัพย์ |
| **อาจารย์ที่ปรึกษา** | อ.ทศพร สังข์กังวาล |
| **หลักสูตร** | ปริญญาเทคโนโลยีบัณฑิต <br> โครงการร่วมบริหารหลักสูตรมีเดียอาตส์และเทคโนโลยีมีเดีย |
| **สาขาวิชา** | มีเดียทางการแพทย์และวิทยาศาสตร์ |
| **คณะ** | สถาปัตยกรรมศาสตร์และการออกแบบ |
| **มหาวิทยาลัย** | มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี |
| **ปีการศึกษา** | 2568 |

<p align="center">
  © 2026 FOOD MY TYPE. All Rights Reserved.
</p>

---

## ✨ ฟีเจอร์หลัก

- 🎬 **Interactive Storytelling** — เล่าเรื่องผ่านฉากชีวิตจริง (คาเฟ่ / ห้างสรรพสินค้า / สวนสนุก)
- ❓ **8 Quiz Questions** — คำถามพฤติกรรมการกิน วิเคราะห์ผลด้วย scoring algorithm
- 🧬 **6 Personality Types** — ผลลัพธ์ที่ไม่ซ้ำใคร เฉพาะตัวคุณ
- 💾 **Save Result** — บันทึกผลลัพธ์เป็นรูปภาพ (download บน Web / บันทึกในคลัง iOS & Android)
- 🎞️ **GIF Animated Backgrounds** — แต่ละฉากมี background เคลื่อนไหว
- ✨ **Smooth Transitions** — Fade animation ระหว่างทุกหน้า
- 📱 **Multi-Platform** — รองรับ Web, iOS, Android, macOS, Windows, Linux

---

## 🧬 6 ประเภทนักกิน

| Type | ชื่อ | ลักษณะ |
|:----:|------|--------|
| 🍬 S | Sugar Seeker | ชอบของหวาน ขาดน้ำตาลไม่ได้ |
| 🌙 L | Night Eater | กินดึกเป็นนิสัย หิวตอนกลางคืน |
| ⏭️ N | Skip Meal | ข้ามมื้อบ่อย ไม่ค่อยสนใจเวลากิน |
| 🍟 F | Fried & Fatty | ติดของทอด ของมัน รสจัด |
| 🥗 B | Balanced Eater | กินสมดุล ดูแลสุขภาพดี |
| 📱 M | Mindless Eater | กินโดยไม่รู้ตัว มักกินระหว่างทำอย่างอื่น |

---

## 🛠️ Tech Stack

| เทคโนโลยี | รายละเอียด |
|-----------|------------|
| **Flutter** | SDK ^3.8.1 — UI Framework |
| **Dart** | ^3.8.1 — Programming Language |
| **responsive_framework** | ^1.0.0 — Responsive layout |
| **gal** | ^2.3.0 — Save image to gallery (iOS/Android) |
| **Firebase Hosting** | Production deployment |
| **Vercel** | Production deployment |
| **Bai Jamjuree** | Custom Thai font |

---

## 🚀 เริ่มต้นใช้งาน

### Prerequisites

```bash
# ตรวจสอบว่ามี Flutter ติดตั้งแล้ว
flutter --version   # ต้องการ Flutter 3.x ขึ้นไป

# ตรวจสอบ environment
flutter doctor
```

### ติดตั้ง

```bash
# 1. Clone โปรเจค
git clone https://github.com/your-username/project_quiz.git
cd project_quiz

# 2. ติดตั้ง dependencies
flutter pub get
```

### รันบนแต่ละ Platform

```bash
# 🌐 Web
flutter run -d chrome

# 📱 iOS (ต้องใช้ macOS + Xcode)
flutter run -d ios

# 🤖 Android
flutter run -d android

# 🖥️ macOS
flutter run -d macos
```

---

## 📦 Build สำหรับ Production

```bash
# Build Web
flutter build web --release

# Build iOS
flutter build ios --release

# Build Android (APK)
flutter build apk --release

# Build Android (App Bundle)
flutter build appbundle --release
```

---

## 🔥 Deploy

### Firebase Hosting

```bash
# ติดตั้ง Firebase CLI (ถ้ายังไม่มี)
npm install -g firebase-tools

# Login
firebase login

# Build Web ก่อน
flutter build web --release

# Copy ไฟล์ไปที่ public/
cp -r build/web/* public/

# Deploy
firebase deploy
```

### Vercel

```bash
# ติดตั้ง Vercel CLI (ถ้ายังไม่มี)
npm install -g vercel

# Build Web ก่อน
flutter build web --release

# Deploy
vercel --prod
```

---

## 🗂️ โครงสร้างโปรเจค

```
project_quiz/
├── lib/
│   ├── main.dart                   # Entry point + asset preloading
│   ├── start.dart                  # หน้าแรก
│   ├── result_page.dart            # หน้าผลลัพธ์ + scoring algorithm
│   ├── page_transitions.dart       # Fade transition helper
│   ├── question_model.dart         # Question model
│   ├── save_image.dart             # Save image (platform router)
│   ├── save_image_web.dart         # Save image — Web (download)
│   ├── save_image_native.dart      # Save image — iOS/Android (gallery)
│   ├── story_pages/                # หน้าเล่าเรื่อง
│   │   ├── story_page_1~9.dart     # เรื่องหลัก
│   │   ├── story_page_cafe_*.dart  # สาขา: คาเฟ่
│   │   ├── story_page_mall_*.dart  # สาขา: ห้างสรรพสินค้า
│   │   └── story_page_themepark_*.dart  # สาขา: สวนสนุก
│   └── quiz_pages/                 # หน้าคำถาม
│       └── quiz_page_1~8.dart      # 8 คำถาม
├── assets/
│   ├── images/                     # GIF backgrounds + UI images
│   │   └── results/                # รูป result card ทั้ง 6 ประเภท
│   └── fonts/                      # Bai Jamjuree (Light/Regular/Medium/SemiBold/Bold)
├── android/                        # Android config
├── ios/                            # iOS config
├── web/                            # Web config
└── public/                         # Firebase Hosting output
```

---

## 🎮 Game Flow

```
[Start Page]
     │
     ▼
[Story 1-3]  ──────────────────────────────────────┐
     │                                              │
     ▼                                              │
[Quiz 1] ── เลือกคำตอบ ──► [Story 4]               │
                                 │                  │
                    ┌────────────┼────────────┐     │
                    ▼            ▼            ▼     │
               [Café]        [Mall]      [Themepark] │
                    └────────────┬────────────┘     │
                                 ▼                  │
                           [Quiz 2~8]               │
                                 │                  │
                                 ▼                  │
                          [Result Page] ◄───────────┘
                      (6 personality types)
                         │            │
                    [บันทึกรูป]   [เล่นอีกครั้ง]
```

---

## 📄 License

This project is for educational purposes.

---

<div align="center">

Made with ❤️ and Flutter

</div>
