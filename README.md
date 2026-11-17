# bunnymark-nelua

A [Bunnymark](https://www.raylib.com/examples.html) implementation written in
[Nelua](https://nelua.io) using the [raylib](https://www.raylib.com) bindings.

Bunnymark is a simple benchmark: it spawns as many bouncing bunny sprites as it
can and reports the frame rate, which makes it a handy way to compare the
performance of languages, compilers and graphics backends.

This port started from the official raylib C example (`main.c`) and was
rewritten in Nelua (`main.nelua`).

## Requirements

- [Nelua](https://nelua.io/installing/) (with a C compiler such as GCC or Clang)
- raylib and its development headers, as required by the Nelua raylib bindings
- X11/OpenGL drivers for your platform

## Build and run

```sh
make
```

This compiles `main.nelua` in release mode with checks and the GC disabled
(`-P nochecks -P nogc`), then starts the demo:

```sh
nelua --release -P nochecks -P nogc --cflags " -O3 -DNDEBUG -flto" main.nelua
```

To remove the generated binary:

```sh
make clean
```

You can also run Nelua directly if you prefer your own flags:

```sh
nelua --release main.nelua
```

## Controls

| Input           | Action                          |
| --------------- | ------------------------------- |
| Hold left mouse | Spawn bunnies at the cursor     |
| `P`             | Pause/unpause bunny movement    |
| `Esc`           | Quit                            |

The top bar shows the current bunny count, the number of batched draw calls and
the FPS counter. The bunny limit is `MAX_BUNNIES` (200000) and the batch size is
`MAX_BATCH_ELEMENTS` (8192 quads) — both can be tweaked at the top of
`main.nelua`.

## Project layout

| File              | Description                                          |
| ----------------- | ---------------------------------------------------- |
| `main.nelua`      | The Bunnymark implementation (Nelua)                 |
| `main.c`          | Original raylib C example, kept for reference        |
| `raylib.nelua`    | Nelua bindings for raylib                            |
| `raygui.nelua`    | Nelua bindings for raygui                            |
| `rlgl.nelua`      | Nelua bindings for rlgl                              |
| `rcamera.nelua`   | Nelua bindings for raylib's camera module            |
| `rayeasings.nelua`| Nelua bindings for raylib's easing functions         |
| `resources/`      | Bunny textures (`raybunny.png`, `wabbit_alpha.png`)  |
| `Makefile`        | Build/run/clean targets                              |

## License

The Nelua port follows the licensing of the original raylib example, which is
released under an unmodified zlib/libpng license. See the header of `main.c` for
details.
