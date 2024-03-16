# Learning Playdate

- [Learning Playdate](#learning-playdate)
  - [Setup SDK](#setup-sdk)
    - [On Linux](#on-linux)
  - [Commands](#commands)
    - [Compiling](#compiling)
    - [Running game on Simulator](#running-game-on-simulator)
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

## Reference

[SDK 2.4.1 Documentation](https://sdk.play.date/2.4.1/)