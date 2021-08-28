# ons_paddo_music_disk




# Development Journal

### 2021 08 28
Ok, so I finally started adding a journal to keep track of the work I have been doing. Here is a quick dump from last night and this morning...

* Last night I finally got memory maps sorted for the demo - the packed animations are actually tiny, so if they are being loaded in progressively (they are) we have heaps of room for code - I mean HEAPS! I also went through and checked the size of all the SID tunes to make sure the buffer for that was the right size. Finally, I also went through all the Exomized files to make sure they would fit in an intial buffer high in RAM - they are all pretty well compressed, so this has worked out well. Put this all in `memory_map.txt` so I don't forget! 
* Set up labels for all the petscii animation frames - kind of weird, but basically all the frames have arbitrary addresses since they have been RLE packed - so I need to have a set of labels defined for each of the groups of animation frames. This was done by taking the output of Kick Assembler and reformatting it into another Kick Assember file. Long live VSCode column edit mode!
* Set up a basic start to the `demo.asm` structure for all the libraries to sit where they are meant to in memory. Nicely used a buffer region for the IRQ loader init code to reside when the demo first loads. Init and then evaporate... 
* Wrote an optimised version of the petscii RLE depacker that depacks two RLE files at once (screen mem and color mem) so we don't get the weird color flash artifact I was getting with the AI demo where I first started using this RLE engine. Needs to be tested.
* Set up a pipelined with exomizer so it would compress chunks of the petscii animation frames. Found and set up a Kick Ass version of the Exo depacker from PasteBin and trimmed it down a little. Need to still adapt it to work with my memory map. May end up Exomizing the music as well, but right now, I don't need to - everything fits on two disks quite nicely.
* Reviewed all the start addresses of Paddo's tunes to make sure my memory map would work and found a few tunes that were running form $4000 instead of $1000, so these are getting fixed. 

_TODO:_ Check the player details for each tune to make sure they are correct for each song. Perhaps put that at the start of each SID so the player can pick up the correct data as the song loads... This will change the size of the files on disk (marginally) so will need to be tested since the disks _just fit_ the 100 songs right now once the code is included. 


