#!/usr/bin/python
#Python script to scroll lines across a 16x2 lcd display.
#Author: Brendan Grant
#Last Update: 3/28/20
import time
import Adafruit_CharLCD as LCD
import sys

# Raspberry Pi pin setup
lcd_rs = 25
lcd_en = 24
lcd_d4 = 23
lcd_d5 = 17
lcd_d6 = 18
lcd_d7 = 22
lcd_backlight = 2

# Define LCD column and row size for 16x2 LCD.
lcd_columns = 16
lcd_rows = 2

lcd = LCD.Adafruit_CharLCD(lcd_rs, lcd_en, lcd_d4, lcd_d5, lcd_d6, lcd_d7, lcd_columns, lcd_rows, lcd_backlight)

text1 = sys.argv[1]
text2 = sys.argv[2]

# Pads the ends of lines with less than 16 chars with spaces
if len(text1) < 16:
		while 16-len(text1) > 0:
				text1 = text1 + " "
if len(text2) < 16:
		while 16-len(text2) > 0:
				text2 = text2 + " "

# Adds a space to the end of the line if necessary
if text1[-1:] != " ":
		text1 = text1 + " "
if text2[-1:] != " ":
		text2 = text2 + " "

tChars1 = list(text1)
tChars2 = list(text2)
start1 = -1
start2 = -1

# Find the longest char array
if len(tChars1) > len(tChars2):
		limit = len(tChars1)
else:
		limit = len(tChars2)

# Runs until the end of the longest char array
for i in range(limit):
		if start1 < len(tChars1):
				start1 += 1
		else:
				start1 = 0
		if start2 < len(tChars2):
				start2 += 1
		else:
				start2 = 0
		
		lcd.clear()

		for x in range(start1, start1+16):
				if x >= len(tChars1):
						lcd.message(tChars1[x-len(tChars1)])
				else:
					lcd.message(tChars1[x])

		lcd.message("\n")
		for y in range(start2, start2+16):
				if y >= len(tChars2):
						lcd.message(tChars2[y-len(tChars2)])
				else:
					lcd.message(tChars2[y])
		time.sleep(0.3)
