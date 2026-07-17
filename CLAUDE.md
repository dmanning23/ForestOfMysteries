# Forest of Mysteries — Claude Context

Atari 2600 homebrew game written in 6502 assembly using the DASM assembler. Early development.

## Build

```sh
dasm ForestOfMysteries.dasm -f3 -v0 -obin/ForestOfMysteries.dasm.bin
```

Output: `bin/ForestOfMysteries.dasm.bin`

Run with Stella: `stella bin/ForestOfMysteries.dasm.bin`

## Architecture

### ROM Layout

16KB ROM, 8 banks of 2KB (F8 bank switching via `$1FF4`–`$1FFB`). All banks share identical startup/trampoline code at their base so the 6502 reset vector works from any bank.

- **Bank 0** (`$1000`): Main game loop, all core subsystems
- **Bank 1** (`$2000`): Title screen
- **Banks 2–7**: Reserved / empty

### Main Loop (Bank 0)

Standard Atari 2600 frame structure in `ForestOfMysteries.dasm`:
1. VSYNC (3 lines)
2. VBLANK/overscan — input, game logic, sprite positioning
3. 192 visible scanlines — `PerformScreenDraw`
4. Overscan (29 lines)
5. `jmp NextFrame`

### Screen Engine

`ScreenEngine/ScreenEngine.dasm` — 8×8 grid of 64 screens.
Current position: `screenRow` (0–7), `screenCol` (0–7).
Each screen dispatches to its own subroutine in `ScreenLogicData.dasm` via a jump table.
Screen transitions happen in `ScreenWraparoundAll` when the player walks off an edge.

Title screen is at row=7, col=7 (set at startup).

### Player

- Position: `playerXPos1`, `playerYPos1` (zero-page)
- Velocity: `playerXVel`, `playerYVel` (set by `CheckInput`, applied by `UpdatePlayerPosition`)
- Sprite: double-size pixels, 9 rows tall (`PLAYER_SPRITE_HEIGHT = 9*2`)
- Horizontal position set cycle-exactly via `SetHorizPos.dasm`

### Audio

Two engines share TIA channels 0 and 1:

**MusicEngine** (`Sound/MusicEngine.asm`) — pattern/arrangement-based music.
Zero-page state: `MUS_FRAME`, `MUS_STEP`, `MUS_PAT_IDX`, `MUS_PLAYING`, `MUS_ARR_OFF`, `MUS_PTR` (2 bytes).
Per-song entry points: `MUSIC_INIT_*`, `MUSIC_UPDATE_*`, `MUSIC_STOP_*`.

**SoundEngine** (`Sound/SoundEngine.asm`) — one-shot SFX.
State: `SFX_LEFT`, `SFX_RIGHT`, `SFX_LEFT_TIMER`, `SFX_RIGHT_TIMER`.
SFX borrows a channel; music detects the flags and skips that channel until SFX finishes.

Current music assets:
- `shadows_gather-music.asm` — title screen
- `whispering_trees-music.asm` — in-game (new, not yet integrated)

## Key Files

| File | Purpose |
|------|---------|
| `ForestOfMysteries.dasm` | Entry point, bank layout, main loop |
| `Constants.dasm` | Screen edges, input bit flags, sprite height |
| `Variables.dasm` | All zero-page variable declarations |
| `CheckInput.dasm` | Game-level input handling |
| `InputEngine.dasm` | Raw controller read and debounce |
| `CharacterMovement.dasm` | Velocity from input |
| `UpdatePlayerPosition.dasm` | Apply velocity, clamp to screen |
| `DrawCharacter.dasm` | Player sprite scanline output |
| `SetHorizPos.dasm` | Cycle-exact horizontal positioning |
| `TitleScreen.asm` | Title screen logic, music start |
| `ScreenEngine/ScreenEngine.dasm` | Screen grid, init, logic dispatch |
| `ScreenEngine/ScreenDrawEngine.dasm` | Scanline draw loop |
| `ScreenEngine/ScreenLogicData.dasm` | Per-screen subroutines (64 screens) |

## Constraints

- **RAM**: 128 bytes total zero-page (`$80`–`$FF`). Every variable costs.
- **ROM per bank**: 4096 bytes (minus vectors at `$FFFA`). Watch for overflow.
- **Timing**: Visible scanlines are cycle-exact. Kernel code in `ScreenDrawEngine.dasm` must hit precise cycle counts — do not add instructions without accounting for cycles.
- **Stack**: Only 256 bytes, shared with the hardware stack. Subroutine call depth matters.
- **No multiply/divide**: Use shifts and lookup tables.

## Assembler

DASM with `-f3` (Atari 2600 format). Segments: `seg.u Variables` (uninitialized, zero-page), `seg Code` (ROM). `rorg` sets the runtime address while `org` sets the file offset.
