VERSION = 0.1.0
PN = system-sounds-script
DM = 50-system-sounds.conf
DS = system-sounds-script.desktop

PREFIX ?= /usr
SYSCONFDIR ?= /etc
LIGHTDMDIR ?= $(SYSCONFDIR)/lightdm/lightdm.conf.d
BINDIR = $(PREFIX)/bin
AUTOSTARTDIR=$(SYSCONFDIR)/xdg/autostart

RM = rm
SED = sed
INSTALL = install -p
INSTALL_PROGRAM = $(INSTALL) -m755
INSTALL_SCRIPT = $(INSTALL) -m755
INSTALL_DATA = $(INSTALL) -m644
INSTALL_DIR = $(INSTALL) -d
Q = @

$(PN): $(PN).in
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)$(SED) 's/@VERSION@/'$(VERSION)'/' $(PN).in > $(PN)

$(DM): $(DM).in
	$(Q)echo -e '\033[1;32mSetting path in '$(DM)'\033[0m'
	$(Q)$(SED) 's#@bindir@#'$(BINDIR)'#' $(DM).in > $(DM)

install: $(PN) $(DM)
	$(Q)echo -e '\033[1;32mInstalling main script...\033[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(BINDIR)"
	$(INSTALL_DIR) "$(DESTDIR)$(LIGHTDMDIR)"
	$(INSTALL_DIR) "$(DESTDIR)$(SYSCONFDIR)/skel"
	$(INSTALL_DIR) "$(DESTDIR)$(AUTOSTARTDIR)"
	$(INSTALL_PROGRAM) $(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(INSTALL_DATA) $(DM) "$(DESTDIR)$(LIGHTDMDIR)/"
	$(INSTALL_DATA) $(DS).in "$(DESTDIR)$(AUTOSTARTDIR)/$(DS)"
	$(INSTALL_DATA) system-sounds.conf "$(DESTDIR)$(SYSCONFDIR)/skel/"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(RM) "$(DESTDIR)$(LIGHTDMDIR)/$(DM)"
	$(RM) "$(DESTDIR)$(AUTOSTARTDIR)/$(DS)"
	$(RM) "$(DESTDIR)$(SYSCONFDIR)/skel/system-sounds.conf"

clean:
	$(RM) -f $(PN)
	$(RM) -f $(DM)

.PHONY: install uninstall clean
