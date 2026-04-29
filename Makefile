ERL_INCLUDE_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)

CC = gcc
CFLAGS = -O3 -Wall -fPIC
LDFLAGS = -shared

ifeq ($(shell uname),Darwin)
	LDFLAGS += -dynamiclib -undefined dynamic_lookup
endif

OUTDIR = priv
NIF = $(OUTDIR)/nif.so
SRC = c_src/nif.c

all: clean $(NIF)

$(NIF):
	mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -I$(ERL_INCLUDE_PATH) -o $@ $(SRC)

clean:
	$(RM) $(NIF)

.PHONY: all clean
