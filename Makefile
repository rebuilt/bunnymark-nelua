.PHONY: all run clean

all: run

run:
	nelua --release -P nochecks -P nogc --cflags " -O3 -DNDEBUG -flto" main.nelua

clean:
	rm -f main
