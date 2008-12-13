CC := gcc
CFLAGS := -g -MMD
LDFLAGS :=
SOURCES := $(wildcard *.c)
OBJECTS := $(SOURCES:.c=.o)
LIBS := -lusb-1.0
EXECUTABLE := wimax

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: clean all

clean:
	rm -f $(EXECUTABLE) *.o *.d

include $(wildcard *.d)
