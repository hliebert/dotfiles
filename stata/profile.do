if inlist(c(stata_version), 14.1) {
  sysdir set PLUS "~/.ado14/plus/"
  sysdir set PERSONAL "~/.ado14/personal/"
  sysdir set OLDPLACE "~/.ado14/"
}

if inlist(c(stata_version), 16.1) {
  sysdir set PLUS "~/.ado16/plus/"
  sysdir set PERSONAL "~/.ado16/personal/"
  sysdir set OLDPLACE "~/.ado16/"
}
