# Forest of Mysteries

An Atari 2600 homebrew game written in 6502 assembly. A multi-screen adventure game where a player character explores a grid of screens — a forest of mysteries.

## Status

Early development. Title screen with music is working. Player movement and screen transitions are implemented across an 8×8 grid of screens.

## Requirements

- [DASM](https://dasm-assembler.github.io/) assembler
- [Stella](https://stella-emu.github.io/) Atari 2600 emulator (for running/testing)

## Building

```sh
dasm ForestOfMysteries.dasm -f3 -v0 -obin/ForestOfMysteries.dasm.bin
```

The compiled ROM is written to `bin/ForestOfMysteries.dasm.bin`.

## Running

```sh
stella bin/ForestOfMysteries.dasm.bin
```

## Project Structure

```
ForestOfMysteries.dasm      Main entry point, bank layout, startup code
Constants.dasm              Screen edges, input flags, sprite constants
Variables.dasm              Zero-page variable declarations
CheckInput.dasm             Input handling (fire, directions)
InputEngine.dasm            Raw controller input read/debounce
CharacterMovement.dasm      Player movement logic
UpdatePlayerPosition.dasm   Apply velocity, enforce screen bounds
DrawCharacter.dasm          Player sprite rendering
SetHorizPos.dasm            Horizontal position setup (cycle-exact)
TitleScreen.asm             Title screen logic and rendering

ScreenEngine/
  ScreenEngine.dasm         Screen grid engine (8×8, 64 screens)
  ScreenDrawEngine.dasm     Per-scanline draw loop
  ScreenDrawSubroutines.dasm Draw helpers
  ScreenDrawData.dasm       Playfield/background data
  ScreenLogicData.dasm      Per-screen logic dispatch table

Sound/
  MusicEngine.asm           Pattern-based music engine
  SoundEngine.asm           One-shot SFX engine
  shadows_gather-music.asm  Title screen music data
  whispering_trees-music.asm In-game music data

Assets/
  Graphics/                 Sprite and playfield graphics data
```

## Technical Notes

### Bank Switching

The ROM uses 16KB with 8 banks of 2KB each (F8-style bank switching via `$1FF4`–`$1FFB`). Each bank begins with identical startup/trampoline code so the game boots correctly regardless of which bank is mapped at power-on.

- **Bank 0**: Main game loop, screen engine, player logic
- **Bank 1**: Title screen

### Screen Engine

Screens are arranged in an 8×8 grid (64 screens total). The current screen is tracked by `screenRow` and `screenCol`. Each screen has its own logic subroutine in `ScreenLogicData.dasm`. Walking off an edge transitions to the adjacent screen.

### Audio

The music engine drives two TIA audio channels using a pattern/arrangement system. The SFX engine borrows a channel when a sound effect fires; the music engine detects this via `SFX_LEFT`/`SFX_RIGHT` flags and automatically resumes once the SFX finishes.
