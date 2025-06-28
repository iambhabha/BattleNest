import time
import subprocess
import random
import re
from PIL import Image
import pytesseract
import cv2
from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.webdriver.common.appiumby import AppiumBy
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import cv2
import pytesseract
import subprocess
import difflib

class BGMIRoomAutomation:
    def __init__(self):
        self.driver = self.setup_driver()
        self.room_id = None
        self.room_password = None

    def setup_driver(self):
        options = UiAutomator2Options()
        options.set_capability("platformName", "Android")
        options.set_capability("deviceName", "Android Device")
        options.set_capability("automationName", "UiAutomator2")
        options.set_capability("appPackage", "com.pubg.imobile")
        options.set_capability("appActivity", "com.epicgames.ue4.SplashActivity")
        options.set_capability("noReset", True)
        options.set_capability("fullReset", False)
        options.set_capability("newCommandTimeout", 300)
        options.set_capability("adbExecTimeout", 300000)
        return webdriver.Remote("http://127.0.0.1:4723", options=options)

    def visual_tap_ratio(self, x_ratio, y_ratio, duration=50, action_name=None):
        width, height = 1080, 2400
        x = int(width * x_ratio)
        y = int(height * y_ratio)
        subprocess.run(["adb", "shell", "input", "swipe", str(x), str(y), str(x), str(y), str(duration)])
        if action_name:
            print(f":point_right: {action_name} — Tap at ({x}, {y}) using ratio ({x_ratio}, {y_ratio})")

    def fill_random_password(self):
        self.room_password = str(random.randint(100000, 999999))
        subprocess.run(["adb", "shell", "input", "text", self.room_password])
        print(f":closed_lock_with_key: Random password filled: {self.room_password}")

    def capture_screen_and_extract_text(self):
        pytesseract.pytesseract.tesseract_cmd = r'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'
        subprocess.run(["adb", "shell", "screencap", "-p", "/sdcard/room.png"])
        subprocess.run(["adb", "pull", "/sdcard/room.png", "room.png"], stdout=subprocess.DEVNULL)
        img = Image.open("room.png").convert("L")
        img = img.point(lambda x: 0 if x < 130 else 255, '1')
        img.save("room_processed.png")
        return pytesseract.image_to_string(img, config="--psm 6")

    def extract_room_details_from_text(self, text):
        room_match = re.search(r'Room\s*[I|l|i|0][D|d|o|0|O][:|\s]*([0-9]{6,})', text, re.IGNORECASE)
        password_match = re.search(r'Room Password[:\s]*(\w+)', text, re.IGNORECASE)
        self.room_id = room_match.group(1) if room_match else None
        return password_match.group(1) if password_match else None

    def is_player_authorized(self, player_name, template_path="home_icon.png"):
        pytesseract.pytesseract.tesseract_cmd = r'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'

        # 🖼️ Take Screenshot
        subprocess.run(["adb", "shell", "screencap", "-p", "/sdcard/room.png"])
        subprocess.run(["adb", "pull", "/sdcard/room.png", "room.png"], stdout=subprocess.DEVNULL)

        img = cv2.imread("room.png")
        if img is None:
            print("❌ Failed to load screenshot.")
            return False

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        data = pytesseract.image_to_data(gray, output_type=pytesseract.Output.DICT)

        found = False
        x = y = w = h = 0
        target = player_name.lower().replace(' ', '')

        for i in range(len(data['text'])):
            raw_name = data['text'][i].strip()
            print(raw_name)
            if not raw_name:
                continue

            name = raw_name.replace(' ', '').lower()
            print(f"[OCR] → '{raw_name}'")

            # Fuzzy match instead of exact match
            similarity = difflib.SequenceMatcher(None, name, target).ratio()
            if similarity > 0.7:
                x, y, w, h = data['left'][i], data['top'][i], data['width'][i], data['height'][i]
                print(f"🧠 Matched '{raw_name}' ≈ '{player_name}' (similarity: {similarity:.2f}) at: ({x}, {y}, {w}, {h})")
                found = True
                break

        if not found:
            print("❌ Player not found by OCR.")
            return False

        # 📐 Safe cropping of icon area
        crop_x = max(0, x - 50)
        crop_y = max(0, y - 60)
        crop_w = 100
        crop_h = 100

        if crop_x + crop_w > img.shape[1] or crop_y + crop_h > img.shape[0]:
            print("❌ Crop region out of bounds.")
            return False

        crop_img = img[crop_y:crop_y + crop_h, crop_x:crop_x + crop_w]

        # 🏠 Load & match template (home icon)
        template = cv2.imread(template_path)
        if template is None:
            print(f"❌ Template not found at: {template_path}")
            return False

        result = cv2.matchTemplate(crop_img, template, cv2.TM_CCOEFF_NORMED)
        _, max_val, _, _ = cv2.minMaxLoc(result)

        print(f"🔍 Match Confidence: {max_val:.2f}")

        if max_val > 0.7:
            print("✅ Authorized user detected")
            return True
        else:
            print("❌ Not authorized")
            return False
    
    def create_room_flow(self):
        steps = [
            (2.14, 0.02, "Close event popup"),
            (0.30, 0.33, "Select map"),
            (0.23, 0.14, "Unranked mode"),
            (1.86, 0.028, "Home creation"),
            (1.91, 0.41, "Room creation"),
            (1.12, 0.35, "Use room card"),
            (1.12, 0.35, "Confirm use card"),
            (1.5, 0.33, "Tap password input"),
        ]
        for x, y, name in steps:
            self.visual_tap_ratio(x, y, action_name=name)
            time.sleep(0.5)

        self.fill_random_password()
        time.sleep(0.5)
        self.visual_tap_ratio(0.2, 0.1, action_name="Dismiss keyboard safely")
        time.sleep(0.5)
        self.visual_tap_ratio(1.5, 0.37, action_name='Tap "Create Room" button')
        time.sleep(0.5)

        self.visual_tap_ratio(1.77, 0.43, action_name="Tap on Spectate button")
        time.sleep(0.5)
        self.visual_tap_ratio(1.223, 0.21, action_name="change position in spectate")
        self.visual_tap_ratio(1.223, 0.21, action_name="change position in spectate")
        time.sleep(0.5)
        self.visual_tap_ratio(1.96, 0.35, action_name="Tap on disale editing")
        time.sleep(0.5)

        for ratio in [1.423, 1.623, 1.823, 2]:
            self.visual_tap_ratio(ratio, 0.21, action_name="disable all spectate box")
            time.sleep(0.2)
        for ratio in [1.223, 1.423, 1.623, 1.823, 2]:
            self.visual_tap_ratio(ratio, 0.30, action_name="disable all bottom spectate box")
            time.sleep(0.2)

        self.visual_tap_ratio(1.96, 0.35, action_name="Tap on disale editing")
        time.sleep(0.5)
        self.visual_tap_ratio(0.2, 0.1, action_name="Dismiss spectate popup")
        time.sleep(2)

    def bring_bgmi_to_front(self):
        print(":calling: BGMI is not in foreground. Bringing to front...")
        subprocess.run([
            "adb", "shell", "am", "start",
            "-n", "com.pubg.imobile/com.epicgames.ue4.SplashActivity"
        ])
        print(":white_check_mark: BGMI brought to front again.")

    def is_bgmi_in_foreground(self):
        result = subprocess.run(
            ["adb", "shell", "dumpsys", "window", "windows"],
            capture_output=True, text=True
        )
        return "com.pubg.imobile" in result.stdout

    def launch_bgmi(self):
        print(":rocket: Launching BGMI via ADB...")
        subprocess.run([
            "adb", "shell", "am", "start",
            "-n", "com.pubg.imobile/com.epicgames.ue4.SplashActivity"
        ])

    def extract_with_retry(self, max_retries=5):
        for attempt in range(1, max_retries + 1):
            print(f"🔄 Attempt {attempt} to extract Room ID and Password...")
            text = self.capture_screen_and_extract_text()
            extracted_password = self.extract_room_details_from_text(text)

            print(f"✅ OCR Text Room ID: {self.room_id}, Password: {extracted_password}")

            if self.room_id:
                self.room_password = extracted_password or self.room_password
                return True

            print("⚠️ Failed to extract, retrying...")
            time.sleep(5)
        return False

    def run(self):
        self.is_player_authorized('AnshuīonīTop')
        # self.launch_bgmi()
        # time.sleep(5)
        # if not self.is_bgmi_in_foreground():
        #     self.bring_bgmi_to_front()
        #     time.sleep(60)
        # else:
        #     time.sleep(25)

        # self.create_room_flow()
        # success = self.extract_with_retry()

        # if success:
        #     print(f"🌿 Final Result — Room ID: {self.room_id}, Password: {self.room_password or 'N/A'}")
        # else:
        #     print("❌ All attempts failed to extract Room ID and Password.")

if __name__ == "__main__":
    bot = BGMIRoomAutomation()
    bot.run()
