# Playdate Haptic Accessory Program

## An application for testing out waveform sequences on the Playdate Console.

# UI

![Screen](https://github.com/SamDamDing/Playdate-Haptic-Accessory-Program/assets/45549722/342ac636-5684-4656-8d77-9422b612c1ae)

`Slot:` - Tells you the active slot you are editing. There are 8 slots in total. Edit them sequentially. If there is an unused slot in between 2 used slots, the waveform sequence will stop playing before the empty slot.

`Haptic ID:` - Tells the Haptic Pattern ID in the DRV2605L Driver.

`Haptic Pattern:` - Tells the name of the Haptic Pattern in the DRV2605L Driver.

`Pattern List` - Lists the Haptic Patterns you can select for the slot.

# Controls

`UP/DOWN` - Scrolls through the Haptic Pattern list.

`LEFT/RIGHT` - Scrolls through the 8 Slots that can be set with a Haptic Pattern.

`B` - Sets the Haptic Pattern for the selected Slot.

`A` - Plays back the Waveform Sequence.

# Menu

![ResetSlotsMenu](https://github.com/SamDamDing/Playdate-Haptic-Accessory-Program/assets/45549722/45b8d5b9-2b53-4c7e-ad2c-bf5958028f2f)

`Reset Slots` - Resets all the slots.

# Requirements

[DRV2605L Driver Board](https://www.adafruit.com/product/2305) 

(I recommend this one because it has QWIIC and STEMMA QT connectors which can be adapted to Grove connectors for the M5Stack CoreS3, which many people already use for the Camera accessory.)

[LRA Motor](https://www.adafruit.com/product/1201)

[Playdate Console](https://play.date/)

[Teensy 4.1](https://www.pjrc.com/store/teensy41.html) 

(More Arduino support coming soon)

[Playdate Haptic Accessory Project Firmware](https://github.com/SamDamDing/Playdate-Haptic-Accessory-Project-Firmware/tree/main)

# HOW TO USE!

Compile the [Playdate Haptic Accessory Project Firmware](https://github.com/SamDamDing/Playdate-Haptic-Accessory-Project-Firmware/tree/main) and upload it to your Teensy 4.1.

Connect your Playdate to the Teensy 4.1's USBHost pins.

Solder the pins and haptic motor to the DRV2605L Driver Board.

Connect the DRV2605L Driver Board to the Teensy 4.1

```
  SDA -> Pin 18
  
  SCL -> Pin 19
  
  GND -> GND
  
  VIN -> 3V
```
