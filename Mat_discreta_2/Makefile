CC=gcc
CFLAGS=-Wall -Wextra -pedantic -std=c99 -I headers -O3 -g -DNDEBUG #-fsanitize=address,undefined

SRCS=EstructuraGrafo24.c APIG24.c main.c API2024Parte2.c
OBJS=$(SRCS:.c=.o)
EXEC=exec

.PHONY: all clean

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJS)
