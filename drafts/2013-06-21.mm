<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node text="Disaster!">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>There is a warning near the top of the .emacs initialization file<br />which says &quot;If you edit it by hand, you could mess it up, so be<br />careful.&quot;  My assumption was that I'd break something and then need to<br />correct the .emacs file. **Wrong**.  I miscoded the url for the<br />org-mode repository and crashed emacspeak. Fixing the .emacs file did<br />no good at all. Emacspeak was silent. Using Speakup to read the<br /><b>messages</b> buffer and discovered the unfixable error.<br />What to do?<br />Mike had a vanilla copy of the emacs directories in the home folder. I<br />renamed my old directories and decompressed the tar ball and voila. I<br />have a happy emacspeak again.<br />##  Protecting Against Such Mistakes<br />Save your working files. Save them like this:<br />#+BEGIN-EXAMPLE<br />tar -cjvf emacspeak.tbz emacspeak/ .emacs.d/</p><p>#+END-EXAMPLE<br />To extract the files in the .tbz file when needed, do this<br />#+BEGIN-EXAMPLE<br />tar -xjvf emacspeak.tbz<br />#+END-EXAMPLE<br />Of course you can modify the filename if desired but keep the<br />extension .tbz.</p></body>
</html>
</richcontent>
</node>
</node>
</node>
</map>
