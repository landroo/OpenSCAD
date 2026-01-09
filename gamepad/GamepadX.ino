/*
 * This example turns the ESP32 into a Bluetooth LE gamepad that presses buttons and moves axis
 *
 * At the moment we are using the default settings, but they can be canged using a BleGamepadConfig instance as parameter for the begin function.
 *
 * Possible buttons are:
 * BUTTON_1 through to BUTTON_16
 * (16 buttons by default. Library can be configured to use up to 128)
 *
 * Possible DPAD/HAT switch position values are:
 * DPAD_CENTERED, DPAD_UP, DPAD_UP_RIGHT, DPAD_RIGHT, DPAD_DOWN_RIGHT, DPAD_DOWN, DPAD_DOWN_LEFT, DPAD_LEFT, DPAD_UP_LEFT
 * (or HAT_CENTERED, HAT_UP etc)
 *
 * bleGamepad.setAxes sets all axes at once. There are a few:
 * (x axis, y axis, z axis, rx axis, ry axis, rz axis, slider 1, slider 2)
 *
 * Alternatively, bleGamepad.setHIDAxes sets all axes at once. in the order of:
 * (x axis, y axis, z axis, rZ axis, rX axis, rY axis, slider 1, slider 2)  <- order HID report is actually given in
 *
 * Library can also be configured to support up to 5 simulation controls
 * (rudder, throttle, accelerator, brake, steering), but they are not enabled by default.
 *
 * Library can also be configured to support different function buttons
 * (start, select, menu, home, back, volume increase, volume decrease, volume mute)
 * start and select are enabled by default
 */

#include <Arduino.h>
#include <BleGamepad.h>

#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif
#define SDA_PIN 5
#define SCL_PIN 6

U8G2_SSD1306_72X40_ER_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);   // EastRising 0.42" OLED

BleGamepad bleGamepad;

bool led = false;

char *chBuff = new char(16);

#define LEDPIN 8
//#define XPIN 1
//#define YPIN 2
#define BTLEFTPIN 10
#define BTUPPIN 7
#define BTRIGHTPIN 4
#define BTDOWNPIN 9
#define BT1PIN 1
#define BT2PIN 2
#define BT3PIN 0
#define BT4PIN 3

void setup()
{
    Serial.begin(115200);
    Serial.println("Starting BLE work!");

    pinMode(BTUPPIN, INPUT_PULLUP);
    pinMode(BTDOWNPIN, INPUT_PULLUP);
    pinMode(BTLEFTPIN, INPUT_PULLUP);
    pinMode(BTRIGHTPIN, INPUT_PULLUP);

    pinMode(BT1PIN, INPUT_PULLUP);
    pinMode(BT2PIN, INPUT_PULLUP);
    pinMode(BT3PIN, INPUT_PULLUP);
    pinMode(BT4PIN, INPUT_PULLUP);

    BleGamepadConfiguration bleGamepadConfig;
    bleGamepadConfig.setAutoReport(false);
    bleGamepadConfig.setButtonCount(1);
    //bleGamepad.begin(&bleGamepadConfig);
    // The default bleGamepad.begin() above enables 16 buttons, all axes, one hat, and no simulation controls or special buttons
    bleGamepad.begin();

    pinMode(LEDPIN, OUTPUT);
    //digitalWrite(8, LOW);

    Wire.begin(SDA_PIN, SCL_PIN);
    u8g2.begin();
    u8g2.clearBuffer();					// clear the internal memory
    u8g2.setFont(u8g2_font_ncenB08_tr);	// choose a suitable font
    u8g2.drawStr(0, 10, "Gamepad");	// write something to the internal memory
    u8g2.drawStr(0, 20, "Connect...");
    u8g2.sendBuffer();
    
}

void loop()
{
    if (bleGamepad.isConnected())
    {
        digitalWrite(8, HIGH);

        int Bt1 = digitalRead(BT1PIN);
        char* bt1 = "";
        if (Bt1 == LOW) 
        {
            bleGamepad.press(BUTTON_1);
            bleGamepad.pressStart();
            bt1 = "Bt1";
        }
        else 
        {
            bleGamepad.release(BUTTON_1);
            bleGamepad.releaseStart();
        }

        int Bt2 = digitalRead(BT2PIN);
        char* bt2 = "";
        if (Bt2 == LOW) 
        {
            bleGamepad.press(BUTTON_2);
            bleGamepad.pressStart();
            bt2 = "Bt2";
        }
        else 
        {
            bleGamepad.release(BUTTON_2);
            bleGamepad.releaseStart();
        }

        int Bt3 = digitalRead(BT3PIN);
        char* bt3 = "";
        if (Bt3 == LOW) 
        {
            bleGamepad.press(BUTTON_3);
            bleGamepad.pressStart();
            bt3 = "Bt3";
        }
        else 
        {
            bleGamepad.release(BUTTON_3);
            bleGamepad.releaseStart();
        }

        int Bt4 = digitalRead(BT4PIN);
        char* bt4 = "";
        if (Bt4 == LOW) 
        {
            bleGamepad.press(BUTTON_4);
            bleGamepad.pressStart();
            bt4 = "Bt4";
        }
        else 
        {
            bleGamepad.release(BUTTON_4);
            bleGamepad.releaseStart();
        }

        int xVal = 2048;
        int yVal = 2048;
        int BtUp = digitalRead(BTUPPIN);
        char* btup = "";
        if (BtUp == LOW) 
        {
            yVal = 4095;
            btup = "BtUp";
        }

        int BtDown = digitalRead(BTDOWNPIN);
        char* btdown = "";
        if (BtDown == LOW) 
        {
            yVal = 0;
            btdown = "BtDown";
        }

        int BtLeft = digitalRead(BTLEFTPIN);
        char* btleft = "";
        if (BtLeft == LOW) 
        {
            xVal = 4095;
            btleft = "BtLeft";
        }

        int BtRight = digitalRead(BTRIGHTPIN);
        char* btright = "";
        if (BtRight == LOW) 
        {
            xVal = 0;
            btright = "BtRight";
        }

        //int xVal = analogRead(XPIN);        
        // Map analog reading from 0 ~ 4095 to 32737 ~ 0 for use as an axis reading
        int xAdjusted = map(xVal, 0, 4095, 32737, 0);
        // Update X axis and auto-send report
        bleGamepad.setX(xAdjusted);
        delay(4);

        //int yVal = analogRead(YPIN);        
        // Map analog reading from 0 ~ 4095 to 32737 ~ 0 for use as an axis reading
        int yAdjusted = map(yVal, 0, 4095, 32737, 0);
        // Update Y axis and auto-send report
        bleGamepad.setY(yAdjusted);
        delay(4);

        //bleGamepad.setAxes(xAdjusted, yAdjusted, 0, 0, 0, 0, 0, 0);       //(X, Y, Z, RX, RY, RZ)

        u8g2.clearBuffer();
        u8g2.drawStr(0, 10, "Connected");	
        sprintf(chBuff, "%s%s", btleft, btright);
        u8g2.drawStr(0, 20, chBuff);

        sprintf(chBuff, "%s%s", btup, btdown);
        u8g2.drawStr(0, 30, chBuff);

        sprintf(chBuff, "%s%s%s%s", bt1, bt2, bt3, bt4);
        u8g2.drawStr(0, 40, chBuff);
        u8g2.sendBuffer();
/*
        Serial.println("Press buttons 5, 16 and start. Move all enabled axes to max. Set DPAD (hat 1) to down right.");
        bleGamepad.press(BUTTON_1);
        bleGamepad.press(BUTTON_2);
        bleGamepad.pressStart();
        bleGamepad.setAxes(32767, 32767, 32767, 32767, 32767, 32767, 32767, 32767);       //(X, Y, Z, RX, RY, RZ)
        //bleGamepad.setHIDAxes(32767, 32767, 32767, 32767, 32767, 32767, 32767, 32767);  //(X, Y, Z, RZ, RX, RY)
        bleGamepad.setHat1(HAT_DOWN_RIGHT);
        // All axes, sliders, hats etc can also be set independently. See the IndividualAxes.ino example
        delay(500);

        Serial.println("Release button 5 and start. Move all axes to min. Set DPAD (hat 1) to centred.");
        bleGamepad.release(BUTTON_5);
        bleGamepad.releaseStart();
        bleGamepad.setHat1(HAT_CENTERED);
        bleGamepad.setAxes(0, 0, 0, 0, 0, 0, 0, 0);           //(X, Y, Z, RX, RY, RZ)
        //bleGamepad.setHIDAxes(0, 0, 0, 0, 0, 0, 0, 0);      //(X, Y, Z, RZ, RX, RY)
        delay(500);
*/
    }
    else {

        u8g2.drawStr(0, 10, "Gamepad");	// write something to the internal memory
        u8g2.drawStr(0, 20, "Connect...");
        u8g2.sendBuffer();

        if(led)
            digitalWrite(8, HIGH);
        else
            digitalWrite(8, LOW);

        led = !led;

        delay(500);
    }
}
