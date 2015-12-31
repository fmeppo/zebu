zebu
====

ZFS Backup Utilities

This little project contains a set of backup utilities designed to work with
ZFS's unique abilities (particularly snapshotting, and send/receive).  It
will be completely useless if you don't have ZFS.  With a proper config file,
it can be used to regularly automate the following backup tasks:

* snapshots for select ZFS filesystems (and their descendants)
* deleting old snapshots
* rsync-ing non-ZFS filesystems (e.g., remote servers) to a ZFS filesystem,
  prior to snapshots
* transmission of snapshots to a remote ZFS server

zebu operates in several pre-defined phases:

* snapshot (may include an rsync to pull data, if needed)
* transmission
* cleanup

For more detailed information, please consult the man page.
