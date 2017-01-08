# `zebu` - the ZFS backup tool with a silly name

`zebu` works on ZFS filesystems (rather than the entire zpool).  Some
filesystems can be configured to be an rsync vault; these filesystems contain
backup copies of data from remote systems, and will trigger an rsync before
they are backed up.  All filesystems are represented by a `class ZFSfs`; vaults
are of `class ZEBUVault` (which inherits from `ZFSfs`).

A singleton `ZEBUConfig` class parses the config files, and manufactures the
array of `ZFSfs` classes in play.  Command-line arguments override values
brought in via `ZEBUConfig`.

After setup, `zebu` passes through three phases: snapshot (where filesystems
get new snapshots), cleanup (where old snapshots are deleted), and transmit
(where the latest snapshots are sent).  Any phase can be skipped, either
globally or for a single `ZFSfs`.  The last transmitted snapshot is never
deleted during the cleanup phase (even if it's reached its expire time).
