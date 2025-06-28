import time
import subprocess
import re
import cv2
import pytesseract
from PIL import Image
import numpy as np
from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.webdriver.common.appiumby import AppiumBy
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Step 1: Setup Appium capabilities
options = UiAutomator2Options()
options.set_capability("platformName", "Android")
options.set_capability("deviceName", "Android Device")
options.set_capability("automationName", "UiAutomator2")
options.set_capability("appPackage", "com.pubg.imobile")
options.set_capability("appActivity", "com.epicgames.ue4.SplashActivity")
options.set_capability("autoLaunch", True)
options.set_capability("noReset", True)  # Always fresh

# Step 2: Launch Appium driver
driver = webdriver.Remote("http://127.0.0.1:4723", options=options)
driver.implicitly_wait(10)
print(" Appium connected and BGMI launched")

# Step 3: Helper to click if element exists
def click_if_exists(text, timeout=5):
    try:
        el = WebDriverWait(driver, timeout).until(
            EC.presence_of_element_located(
                (AppiumBy.ANDROID_UIAUTOMATOR, f'new UiSelector().text("{text}")')
            )
        )
        el.click()
        print(f" Clicked: {text}")
    except:
        print(f"ℹ️ '{text}' not found, skipping.")

# Visual tap using adb swipe
def visual_tap(x, y, duration=50):
    subprocess.run(["adb", "shell", "input", "swipe", str(x), str(y), str(x), str(y), str(duration)])
    print(f" Tap at ({x}, {y})")

# Step 4: Handle permission popups (only on first launch)
click_if_exists("Allow")
click_if_exists("Allow")
click_if_exists("Allow all")

# OCR function to capture text from screen
def get_ocr_text():
    subprocess.run(["adb", "shell", "screencap", "-p", "/sdcard/screen.png"])
    subprocess.run(["adb", "pull", "/sdcard/screen.png", "screen.png"], stdout=subprocess.DEVNULL)
    img = cv2.imread("screen.png")
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    text = pytesseract.image_to_string(gray)
    return text

# Extract downloaded MB and total from OCR
def extract_downloaded_mb(text):
    match = re.search(r'(\d+)\s*MB\s*/\s*(\d+)\s*MB', text)
    if match:
        return int(match.group(1)), int(match.group(2))
    return None, None

# Step 5: Estimate download completion time and wait

def wait_for_full_resource_download(max_retries=3):
    print("🔍 Checking resource download progress...")
    retries = 0
    start_mb, total_mb = None, None

    while retries < max_retries:
        text = get_ocr_text()
        print(f"🔍 OCR Text: {text}")
        start_mb, total_mb = extract_downloaded_mb(text)
        if start_mb and total_mb:
            break
        print("⚠️ Retry fetching MB info...")
        retries += 1
        time.sleep(3)

    if not start_mb or not total_mb:
        print("❌ Failed to get download info after retries.")
        return

    time.sleep(5)

    new_text = get_ocr_text()
    new_mb, _ = extract_downloaded_mb(new_text)
    if not new_mb:
        print("⚠️ Couldn't read updated MB. Skipping.")
        return

    speed = (new_mb - start_mb) / 5  # MB/sec
    remaining = total_mb - new_mb
    if speed <= 0:
        print("⚠️ Speed zero or negative, download not progressing.")
        return

    wait_time = int(remaining / speed) + 5  # buffer
    print(f"⏳ Estimated wait time: {wait_time} sec for resource pack")
    time.sleep(wait_time)

    final_text = get_ocr_text()
    if "Low-spec" in final_text:
        print(" Low-spec option now visible.")
        visual_tap(800, 500)
    else:
        print("❌ Low-spec option not found after wait.")

# Step 6: OCR wait for "Low-spec"
def wait_and_tap_low_spec(timeout=90, interval=3):
    print("🔍 Waiting for 'Low-spec' via OCR...")
    start = time.time()
    while time.time() - start < timeout:
        subprocess.run(["adb", "shell", "screencap", "-p", "/sdcard/temp.png"])
        subprocess.run(["adb", "pull", "/sdcard/temp.png", "temp.png"])
        subprocess.run(["adb", "shell", "rm", "/sdcard/temp.png"])

        img = cv2.imread("temp.png")
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        text = pytesseract.image_to_string(gray)
        if "Low-spec" in text:
            print(" Detected 'Low-spec'")
            visual_tap(800, 500)  # Update coordinates as needed
            return True
        else:
            print("⏳ Not found yet, retrying...")
            time.sleep(5)

    print("❌ Timeout. 'Low-spec' not detected.")
    return False

time.sleep(25)  # Allow time for initial loading

# Run the OCR wait function
wait_and_tap_low_spec()

# Step 7: Try clicking OK button
time.sleep(180)  # Allow time for low-spec to appear

print(" Done")
driver.quit()  # Optional
options = UiAutomator2Options()
options.set_capability("platformName", "Android")
options.set_capability("deviceName", "Android Device")
options.set_capability("automationName", "UiAutomator2")
options.set_capability("appPackage", "com.pubg.imobile")
options.set_capability("appActivity", "com.epicgames.ue4.SplashActivity")
options.set_capability("autoLaunch", True)
options.set_capability("noReset", True)  # Always fresh

# Step 2: Launch Appium driver
driver = webdriver.Remote("http://127.0.0.1:4723", options=options)
time.sleep(180)