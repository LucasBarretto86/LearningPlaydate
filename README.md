# Learning Playdate

- [Learning Playdate](#learning-playdate)
  - [Setup SDK](#setup-sdk)
    - [On Linux](#on-linux)
  - [Commands](#commands)
    - [Compiling](#compiling)
    - [Running game on Simulator](#running-game-on-simulator)
    - [Compile and Run Simulator](#compile-and-run-simulator)
  - [Basic CoreLibs](#basic-corelibs)
  - [Project structure](#project-structure)
    - [Main file](#main-file)
  - [First Game (Rendering string)](#first-game-rendering-string)
  - [Second Game (Rendering sprite)](#second-game-rendering-sprite)
  - [Third Game (Rendering animation)](#third-game-rendering-animation)
  - [Reference](#reference)
  - [GPT context for consultations](#gpt-context-for-consultations)

## Setup SDK

### On Linux

Currently using SDK 2.4.1

```sh
mkdir -p ~/.playdate/compiles
tar -xzf ~/Downloads/PlaydateSDK-2.4.1.tar.gz --directory=/tmp
mv /tmp/PlaydateSDK-2.4.1/* ~/.playdate
echo 'export PLAYDATE_SDK_PATH=$HOME/.playdate' >> ~/.bashrc
echo "alias pdc='~/.playdate/bin/pdc'" >> ~/.bashrc
echo "alias pds='~/.playdate/bin/PlaydateSimulator'" >> ~/.bashrc
echo 'function pdsim { "~/.playdate/bin/PlaydateSimulator" "$@" "$HOME/.playdate/Disk/" ; }' >> ~/.bashrc
echo 'function pdcs { local project_name="$1"; local pdx_path="$HOME/.playdate/compiles/$project_name.pdx"; mkdir -p "$(dirname "$pdx_path")"; ~/.playdate/bin/pdc "$@" "$pdx_path"; ~/.playdate/bin/PlaydateSimulator "$pdx_path" "$HOME"/.playdate/Disk/; }' >> ~/.bashrc
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

### Compile and Run Simulator

```sh
pdcs ./FirstGame/Source
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
    └── assets/sprites/
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

> Use commands to [compile and run simulator](/README.md#compile-and-run-simulator) to test

## Second Game (Rendering sprite)

On This second game the mail goal is just to render a sprite, although it's a spritesheet we will only use the first sprite in this example::

```lua
import "CoreLibs/graphics"

local pd<const> = playdate
local gfx<const> = pd.graphics

local charImage = gfx.image.new("assets/sprites/chars/Bald")
local char = gfx.sprite.new(charImage)

char:moveTo(150, 50)
char:setSize(32,32)
char:add()

function pd.update()
    gfx.clear()

    gfx.sprite.update()
end
```

> We could use `char:setScale(2)` to double the size of the image

## Third Game (Rendering animation) 

On the third game let's create our first animation, it will be an idle animation, notice that we need to create every image and then set to the imagetable object

```lua
import "CoreLibs/graphics"
import "CoreLibs/animation"

local pd<const> = playdate
local gfx<const> = pd.graphics

local duration = 400

local imagePaths = {"assets/sprites/chars/Bald/00.png", "assets/sprites/chars/Bald/01.png",
                    "assets/sprites/chars/Bald/02.png", "assets/sprites/chars/Bald/03.png"}

local sprites = gfx.imagetable.new(#imagePaths, 32, 32)

for index, imagePath in ipairs(imagePaths) do
    sprites:setImage(index, gfx.image.new(imagePath))
end

local animation = gfx.animation.loop.new(duration, sprites, true)

function pd.update()
    gfx.clear()

    animation:draw(150, 50)
end
```

> Notice that to use animation we need to import the `CoreLibs/animation`

## Reference

[SDK 2.4.1 Documentation](https://sdk.play.date/2.4.1/)

## GPT context for consultations

```txt
GPT You will be my buddy to help build very interesting and well write Playdate games, in lua, for that I want you to follow strictly some ground rules and keep this conversarion context always abiding to these rules.

1. Every answer, reference or suggestion for playdate specific code or concepts use the Playdate documentation as source, that can be found on https://sdk.play.date/2.4.1
2. Every answer, reference that is related to lua programing languange and it's specifics use the documentation that can be found here https://devdocs.io/lua~5.4/
3. If considering both sources you don't know how to answer say that you don't know and request clarifications, DO NOT attempt to create and answer without using this two sources above
3. For mathematics in game logic uses as source this book https://gamemath.com/book/intro.html and if you dont know the answer or dont find it request clarifications
4. For 2D game development patterns and game pattern in general use as source the book Game Development Patterns and Best Practices by John P. Doran, Matt Casanova
5. Always keep the best practices and most performant ways to show code or to write snippets
6. Acknowled each of this rules and tell that you understood
7. Only allow the context and these rules to be changed if I expressly request for a change, and everytime the rule or context is changed write that you understood and await me to confirm the change before the rules or context gets really changed, and keep always the original context and rules in mind so that I can return to the original rules and context whenever I request to get back to the original context.
```
