# Learning Playdate

- [Learning Playdate](#learning-playdate)
  - [Setup SDK](#setup-sdk)
    - [On Linux](#on-linux)
  - [Commands](#commands)
    - [Compiling](#compiling)
    - [Running game on Simulator](#running-game-on-simulator)
  - [Basic CoreLibs](#basic-corelibs)
  - [Project structure](#project-structure)
    - [Main file](#main-file)
  - [First Game (Rendering string)](#first-game-rendering-string)
  - [Second Game (Rendering sprite)](#second-game-rendering-sprite)
  - [Reference](#reference)

## Setup SDK

### On Linux

Currently using SDK 2.4.1

```sh
mkdir -p ~/.playdate
tar -xzf ~/Downloads/PlaydateSDK-2.4.1.tar.gz --directory=/tmp
mv /tmp/PlaydateSDK-2.4.1/* ~/.playdate
echo 'export PLAYDATE_SDK_PATH=$HOME/.playdate >> ~/.bashrc
echo "alias pdc='~/.playdate/bin/pdc'" >> ~/.bashrc
echo 'function pdsim { "~/.playdate/bin/PlaydateSimulator" "$@" "$HOME/.playdate/Disk/" ; }' >> ~/.bashrc
source ~/.bashrc
```

## Commands

### Compiling

Relative compile command

```sh
pdc ./FirstGame/Source ./Compiled/FirstGame.pdx
```

### Running game on Simulator

```sh
pdsim ./Compiled/FirstGame.pdx
```

## Basic CoreLibs

In most part of the games we will use some of these basic CoreLibs

```lua
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/animator"
```

## Project structure

To create a game can follow this basic structure

```mono
GameName
└── Source
    └── main.lua
```

> Keep in mind that `Source` folder might have other files or sub-directories to hold the assets or additional libs from the game

### Main file

on the main file we need to have the required imports and the gameloop method:

```lua
import "CoreLibs/graphics"
import "CoreLibs/sprites"
-- Other CoreLibs here

-- Variables
local gfx = playdate.graphics

-- Definitions
playdate.display.setRefreshRate(20) -- By tdefault RefreshRate is 30

-- GameLoop
function playdate.update()
    -- ... code here
end

```

## First Game (Rendering string)

The first game experience is an attempt to render a string on playdate

To able to render something we need to create or `main.lua` file and start importing a playdate core lib to handle graphics

```lua
-- FirstGame/Source/main.lua

import "CoreLibs/graphics"

local gfx = playdate.graphics

function playdate.update()
    gfx.drawText("First Game has *Started*", 10, 10)
end
```

> Use commands to [compile](/README.md#compiling) and [run simulator](/README.md#running-game-on-simulator) to test

## Second Game (Rendering sprite)


## Reference

[SDK 2.4.1 Documentation](https://sdk.play.date/2.4.1/)