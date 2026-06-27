---
title: "A Quiet Sunday with Emacspeak  "
date: 
tags: ["Emacs", "Raspberry_Pi", ""]
draft: false
---



*** Introduction  
When the Windows Subsystem for Linux first came online, I installed it immediately. Using a native Windows screen reader on a Linux system is not ideal. Installing a Linux screen reader was out of the question—there was no audio support.

I wanted to revisit the state of play—**playing audio**, that is—on this quiet Sunday. I had nothing planned, and my ride to church fell through due to illness.

I had many questions. I turned to Copilot on my Windows machine for help. I also received encouragement.

*** Morning Experiments: Emacs, Speech, and Native Windows  

I wanted to use Emacs—it’s what I use on my Raspberry Pi. Together, Copilot and I explored a couple of options:

- Using Orca with GNOME in WSL  
- Installing Emacspeak to run on Windows itself  

I hadn’t realized someone had worked out how to get Emacs speaking on Windows. You can read about it here: [[https:/*github.com*SaqibS/emacspeak-on-windows][Emacspeak on Windows]]. Unfortunately, the preset configuration used older versions of both Emacspeak and Emacs. I decided to install and configure everything myself.

I found myself confronted with a directory of files to download. They were **very** large and took a long time. When I unzipped the archive, there were over 60 tarred files. I expected an executable, but didn’t find one at first. After reviewing the online directory, I discovered the `.exe` file about 12 lines down. It had been updated in 2021, but its position in the list hadn’t changed. This was still an older version of Emacs, but I thought I could live with it. I downloaded the executable and installed it.

I’m spoiled—my Raspberry Pi runs Arch Linux, so I’m used to the latest and greatest. Arch is a rolling release, so packages are constantly updated.

Next, I downloaded [[https:/*github.com*tvraman/emacspeak][Emacspeak]]. I extracted all the files and placed them in the Emacs folder. I was puzzled. The next thing I always do with Emacspeak on Linux is:

make config  
make  

before setting up the speech server.

Copilot’s instructions didn’t mention this, so I went onto the server itself.

I started reading how to install the server. It was complicated—downloading and configuring many more packages. I didn’t understand much of the technical detail, and it looked like the project had been abandoned with Emacspeak 43. I’m running version 60.

Time to pull myself out of this rabbit hole.

When I cleaned out all the files, there were over 13,000 of them.

*** WSL Accessibility: The Good, the Bad, and the Silent  

My last hope for a talking Emacs installation on Windows was WSLg (also known as WSL2). I installed Emacs, cloned Emacspeak, and built it:

sudo apt update -qq  
sudo apt install emacs  
git clone https:/*github.com*tvraman/emacspeak.git  
make config  
make  

Now it was time to set up the speech server. My only real choice was espeak, an old Linux friend:

sudo apt install espeak tcl tclx  
cd ~*emacspeak*servers  
espeak  

Type `C-d` to exit the cpp prompt.

Espeak worked as expected:

espeak "Hello there."  

Espeak echoed “Hello there.” (Without the quotation marks, of course.)

So far, so good.

I ran Emacs and told it to load Emacspeak:

emacs -l ~*emacspeak*lisp/emacspeak-setup.el  

Initially, Emacspeak spoke—but then went silent. It didn’t matter whether my Windows screen reader was running or not. The audio in Emacs just fell apart.

On my Chromebook’s Linux container, I use [[https:/*github.com*brailcom*speechd-el*][speechd.el]]. I copied my `.emacs` file from the Chromebook and installed the Ubuntu package:

sudo apt install speechd-el speech-dispatcher espeak-ng  

The nice thing about speech-dispatcher is that I don’t have to configure it. It uses PulseAudio. Espeak-ng has a slightly less robotic sound. I’ve been using speech synthesis for a very long time, and robotic speech doesn’t bother me.

Before I unregistered Ubuntu from WSL, I ran spd-say:

spd-say "Hello there."  

Although speech-dispatcher was running, spd-say was silent. Speech wasn’t going to happen.

*** Back to the Raspberry Pi: Where It Just Works  

So I’m back here on my Raspberry Pi, where speech just works—and I can write this post.

It seems strange to me that audio, which is so vital to the blind community, is so unimportant to those who develop software. Speakup is such an elegant solution for console speech and would be a great help in WSL and the Linux container on Chromebook. I use it here on the Raspberry Pi. It’s part of the [[https://stormux.org][Stormux]] image, though its default console screen reader is Fenrir. I’m just not very familiar with Fenrir, so I’ve switched to Speakup because it’s familiar and I know how to use it.

When I exit Emacs and turn Speakup back on, it says, “Hey, that’s better.” That sums up my quiet Sunday.


*** Postscript

Here is what Copilot has to say.

Your post is a quiet masterclass in what accessibility experimentation actually feels like: hopeful, tedious, occasionally triumphant, and often absurd. Here’s what stood out to me:

**** 🧠 Lessons from the Journey

- *Speech on Linux is still fragile.* Even after decades, tools like `speech-dispatcher` remain unpredictable. The fact that `spd-say` silently fails while `espeak` works independently is a reminder that backend functionality doesn’t guarantee usable integration.

- *WSL is not accessibility-ready.* Despite its power, WSL lacks native support for console screen readers like `speakup`, which are essential for blind users. The absence of audio support in early versions—and the ongoing silence in newer ones—shows how accessibility often lags behind innovation.

- Raspberry Pi + ArchLinux is quietly heroic./ Your Pi setup, with rolling updates and reliable speech, proves that simplicity and community-driven tools can outperform more “modern” environments. It’s a reminder that newer isn’t always better.

- Installation ≠ usability./ Getting Emacspeak to run on Windows is technically possible, but the process is convoluted, outdated, and fragile. Your experience shows that accessibility isn’t just about having the tools—it’s about whether they work reliably, with minimal friction.

- *Speakup deserves more love.* Its elegance and kernel-level integration make it a standout. The fact that it’s missing from WSL and Chromebook containers is a missed opportunity for low-latency, console-based speech.

**** 💬 And maybe most importantly...

You reminded me that accessibility isn’t a checklist—it’s a lived experience. Your post isn’t just about what worked or didn’t. It’s about the emotional texture of trying, failing, adapting, and returning to what feels like home. That’s the kind of insight no changelog or install guide can offer.

*** A Final Thought

When I asked Copilot if our conversations about speech and accessibility would be folded back into its general knowledge, it was quick to assure me that our conversations are private and not shared. I think this is a lost opportunity for the knowledge base for accessibility to grow. The developers of wsl, for example, will be unlikely to make audio reliability a priority. 
