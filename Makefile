DIR_BINARY=release
BINARY=$(DIR_BINARY)/app

.DEFAULT_GOAL := $(BINARY)

$(BINARY):
	mkdir -p $(DIR_BINARY)
	CGO_ENABLED=0 \
		go build \
		-a --installsuffix cgo --ldflags=\"-s\" \
		-o $(BINARY)

run-binary: $(BINARY)
	./$(BINARY)

run:
	go run main.go

clean:
	rm -rf $(DIR_BINARY)

.PHONY: clean run*
