# Wallpapertimer
A CLI tool that sets all wallpapers of all screens based on groups defined by a certain folder structure. Supports to use groups for certain hours of the day.

## Features

### Multiscreen Mode

If multiple screens are available, a group of pictures (i.e. a folder), see Examples section below, is spread across the screens:

![Multiple Screen Example](https://raw.githubusercontent.com/Lutzifer/Wallpapertimer/master/imgs/multiscreen_example.jpg)

### Singlescreen Mode

If only a single screen is available, a collage of up to four images from a group is set as the wallpaper:

![Single Screen Example](https://raw.githubusercontent.com/Lutzifer/Wallpapertimer/master/imgs/singlescreen_example.jpg)


## Installation

```
brew tap lutzifer/homebrew-tap
brew install wallpapertimer
```

## Usage

```
Usage: wallpapertimer [options]
  -s, --sourcepath:
      Path to the Folder which contains the Folders 'morning' (begins at 6 ó clock), 'noon' (begins at 11 ó clock), 'afternoon' (begins at 13 ó clock), 'evening' (begins at 17 ó clock), 'night' (begins at 22 ó clock) and 'all' (used if other folder is empty or -d flag not given).
  -h, --help:      
      Prints a help message.
  -d, --daytime:   
      Use folders depending on the time of day.
```

## Examples

Given the Structure 

```
/Wallpapers
  /morning
    /A
      1.jpg
      2.jpg
      3.jpg
    /B
      1.jpg
      2.jpg
      3.jpg
  /noon
    /C
      1.jpg
      2.jpg
      3.jpg
    /D
      1.jpg
      2.jpg
      3.jpg
  /afternoon
    /E
      1.jpg
      2.jpg
      3.jpg
    /F
      1.jpg
      2.jpg
      3.jpg
  /evening
    /G
      1.jpg
      2.jpg
      3.jpg
    /H
      1.jpg
      2.jpg
      3.jpg
  /night
    /I
      1.jpg
      2.jpg
      3.jpg
    /K
      1.jpg
      2.jpg
      3.jpg
  /all
    /L
      1.jpg
      2.jpg
      3.jpg
    /M
      1.jpg
      2.jpg
      3.jpg
```

the following commands have different effects:

```
wallpapertimer -s "/Wallpaper"
```

takes (a) random image/images from either /Wallpaper/all/L or /Wallpaper/all/M

```
wallpapertimer -d -s "/Wallpaper"
```

takes (a) random image/images from one of the /Wallpaper/\<daytime\>/\<Subfolder\>, e.g. /Wallpaper/night/I, or from /Wallpaper/all/L or /Wallpaper/all/M

## Automation

You can set up automatically switching the wallpapers after some time by defining a job using http://www.soma-zone.com/LaunchControl/

Just set the job to run to something like 

```
/usr/local/bin/wallpapertimer -d -s /Volumes/EXTENSION/Wallpapers/
```

and set a regular start interval, e.g. 900 seconds.

![launchcontrol](https://raw.githubusercontent.com/Lutzifer/Wallpapertimer/master/imgs/launchcontrol.png)
