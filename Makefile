VERSION := `git describe --tags`
PACKAGE := process_exporter-$(VERSION).linux-amd64

process_exporter: process_exporter.go
	GOOS=linux GOARCH=amd64 go build -ldflags "-X main.version=$(VERSION)" process_exporter.go

package: process_exporter
	rm -rf $(PACKAGE)
	mkdir $(PACKAGE) 
	cp -fva process_exporter $(PACKAGE)/
	cp -fva README.mkdn      $(PACKAGE)/
	tar -czvpf $(PACKAGE).tar.gz $(PACKAGE)

clean:
	rm -f process_exporter

.PHONY: clean
