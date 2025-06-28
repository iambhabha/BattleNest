# 🎮 BGMI Tournament Automation App (Open Source)

This is an **open-source mobile app** to organize and automate **BGMI tournaments** with a beautiful UI and powerful backend automation — **fully powered by Firebase**!

> 💡 **UI Inspired by:**  
> 🎨 [Dribbble Design Source](https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center)  
> 💼 [Behance Project](https://www.behance.net/gallery/199177723/Mobile-Application-Design-for-Gaming-Platform)

---

## 📱 Preview

<div align="center">
  <img src="https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center" width="100%" />
</div>

---

## 🚀 Features

✅ Create tournaments with game mode, player capacity, and prize pool  
✅ Automated **room creation** with Firebase Cloud Functions  
✅ Auto **kick logic** using real-time validation in Firestore  
✅ Share tournaments via links  
✅ Player registration, match scheduling, and leaderboard  
✅ Admin/Host panel with control options  

---

## 🔥 Powered by Firebase

| Feature              | Firebase Service Used            |
|----------------------|----------------------------------|
| Authentication       | Firebase Auth                    |
| Database             | Firestore                        |
| Automation Logic     | Cloud Functions (Node.js)        |
| Storage (Images)     | Firebase Storage                 |
| Notifications        | Firebase Cloud Messaging (FCM)   |
| Hosting (Optional)   | Firebase Hosting (Web version)   |

---

## 💡 How Automation Works

- **Room Creation**  
  → When a match is scheduled, a Firebase Cloud Function creates a virtual "room" entry and updates all participants in real time.

- **Auto Kick System**  
  → Players not verifying before deadline or breaking rules are auto-removed using Firestore triggers.

- **Live Updates**  
  → Firestore streams enable instant updates for players and hosts.

---

## 🛠 Tech Stack

| Layer       | Technology      |
|-------------|-----------------|
| Frontend    | Flutter         |
| Backend     | Firebase (100%) |
| Auth        | Firebase Auth   |
| DB          | Firestore       |
| Logic       | Cloud Functions |
| Messaging   | FCM             |

---

## 🧪 Getting Started

1. **Clone the Repo**
   ```bash
   git clone https://github.com/yourusername/bgmi-tournament-app.git
   cd bgmi-tournament-app

## 🤝 Contribution & Reward System

We welcome all contributors — whether you're a developer, designer, tester, or just someone with a great idea. This is a community-driven open-source project, and we strongly believe in sharing growth, visibility, and rewards with everyone who supports it.

---

### ✅ How You Can Contribute

1. **💻 Code Contributions**
   - Fix bugs or crashes
   - Add new features (e.g. leaderboard, dark mode, team system)
   - Improve UI/UX or animations

2. **⚙️ Firebase Enhancements**
   - Optimize or add new Cloud Functions
   - Improve automation for room creation or kicking logic

3. **📘 Documentation**
   - Write or improve the README, setup guides
   - Create tutorial videos or language translations

4. **🌐 Community Support**
   - Help others in Issues or Discussions
   - Report bugs with details
   - Suggest useful features or improvements

---

### 🏅 Recognition & Shout-outs

If you contribute meaningfully, you will:
- Be listed in `CONTRIBUTORS.md`
- Get a Contributor badge on GitHub
- Receive public shout-outs in release notes and social posts
- Be featured in the **"Top Contributors" section of the app (coming soon)**

---

### 💸 Earning Opportunities

This project is open-source, but if it grows into something bigger or generates revenue through:
- Sponsorships  
- Premium versions  
- Freelance requests  

…then **top contributors will receive a fair share** or be offered **paid tasks** like:

- Feature development
- Custom module work
- App maintenance or bug fixes

> We’re committed to sharing growth with the community that builds this. Your support matters.

---

### 💡 Suggest New Ideas

We love smart contributions. Feel free to suggest:
- New game modes or logic
- UI/UX improvements
- Admin tools or analytics dashboards
- Any idea that helps organizers or players

Open an [Issue](https://github.com/yourusername/bgmi-tournament-app/issues) or reach out directly.

---

### 📜 Contribution Rules

- Be respectful and collaborative
- Keep your code clean, tested, and explain changes clearly
- Avoid AI-generated/copied content without reviewing
- Use Pull Requests for all changes (no direct pushes)

---

Let's build something amazing together — and if this project succeeds, **you succeed with it.**


