# Background Data Export Fix

## The Problem

The tile editor is exporting 193 bytes per bitmap channel, but the game's 4-line kernel only reads 48 of them. The other 145 bytes per bitmap are dead ROM that never get read at runtime — wasting **870 bytes per screen file** and causing bank overflow.

### Why Only 48 Bytes Are Read

The draw kernel uses register Y as a direct scanline index. Y starts at 192 and decrements by 1 every 4 scanlines, so it only travels from 192 down to 145 — a range of 48 values. Array bytes at indices 0–144 are unreachable.

```
Y = 192  ← top of screen    (array index 192)
Y = 191
Y = 190
...
Y = 145  ← bottom of screen (array index 145)
          array indices 0–144 = never read
```

The kernel instruction is:
```asm
lda FoM_1Bitmap0,Y   ; reads array[Y], Y ranges 145–192
```

## The Fix

### Part 1 — Game engine change (already handled separately)

In each screen draw subroutine, `ldy #192` changes to `ldy #47`. After this change the kernel reads indices 0–47 instead of 145–192.

### Part 2 — Export tool change (this document)

Each bitmap channel should export **48 bytes**, not 193.

The 48 bytes represent the 48 data rows of the screen (one row per 4 scanlines × 48 rows = 192 scanlines total). Index 0 = bottom of screen, index 47 = top of screen.

## Current (Wrong) Export Format

```asm
FoM_1Bitmap0
    hex 00                                    ; guard byte — never read
    hex 00000000000000000000000000000000      ; never read (indices 1–16)
    hex 00000000000000000000000000000000      ; never read (indices 17–32)
    hex 00000000000000000000000000000000      ; never read ...
    hex 00000000000000000000000000000000
    hex 00000000000000000000000000000000
    hex 00000000000000000000000000000000
    hex 00000000000000000000000000000000
    hex 00000000000000000000000000000000
    hex 00000000000000000000000000000000      ; never read (indices 129–144)
    hex 10101010101010101010101010101010      ; READ: bottom rows (indices 145–160)
    hex 10101010101010101010101010101010      ; READ: middle rows (indices 161–176)
    hex 101010101010101010101010101030f0      ; READ: top rows    (indices 177–192)
```

193 bytes total, only last 48 ever read.

## Correct Export Format

```asm
FoM_1Bitmap0
    hex 10101010101010101010101010101010      ; bottom rows (index 0–15)
    hex 10101010101010101010101010101010      ; middle rows (index 16–31)
    hex 101010101010101010101010101030f0      ; top rows    (index 32–47)
```

48 bytes total, all read.

The hex values themselves **do not change** — just drop the unreachable leading bytes.

## Data Ordering

- Index **0** = bottom of screen (last rows rendered)
- Index **47** = top of screen (first rows rendered)

This matches the current ordering: the kernel reads from high Y to low Y as it scans top-to-bottom, so the byte at the highest index is the topmost row.

## File Structure

Each screen data file exports **6 bitmap channels** (Bitmap0–Bitmap5, corresponding to PF0–PF2 for the left and right halves of the playfield). Each channel should have exactly 48 bytes.

Current file size: ~1158 bytes (193 bytes × 6 channels)  
Correct file size: ~288 bytes (48 bytes × 6 channels)

## Impact

Each bank holds 3 screens with 3 data files. After the fix:

| | Before | After | Saved |
|---|---|---|---|
| Bytes per bitmap | 193 | 48 | 145 |
| Bytes per screen file | 1158 | 288 | 870 |
| Bytes per bank (3 files) | 3474 | 864 | 2610 |

The banks go from overflowing to having ~2600 bytes of headroom.
