.. title: Various Strategies
.. slug: various-strategies
.. date: 2014-09-24 21:20:47 UTC-05:00
.. categories: Linux
   .. tags: technology, Raspberry Pi
.. link: 
.. description: 
.. type: text

I started the day thinking I would experiment with Mate on Debian. I started a fresh install on my old laptop. By noon I was digging out a netbook and expecting to put apache and webmin on it. I did but ran into a few problems with ssl again. I thought I would be going back to owncloud. I found some commands for ssl on the manual installation page.

Then I began to wonder while I was setting up the second netbook: why won't this work on a pi and why not use ftp.

This was brought about because I confused file server with ftp server on the Debian install. It turns out that file server means samba.

So here's the plan:

1. Configure vsftp to use external storage.
2. Connect the ntfs 2TB external drive as well to the pi and use it as a backup to the ext4 drive.
3. Use a cron job to keep everything in sync and email the results.

By doing this I can corral my files for publishing and writing to La Jefa.

