# Nottz

## Raison d'être
I've been using a [popular theme for my Hugo blog](https://github.com/pacollins/hugo-future-imperfect-slim) that had some quirky markdown front matter for posts. 

I worked on my fork until I realized 
that a lot of the stuff I was toiling to sort in my fork had been 
properly addressed and improved upon in the original. 

As I moved back, 
however, I realized that the templating had been switched, which was 
announced in a [fairly extensive PR](https://github.com/pacollins/hugo-future-imperfect-slim/pull/154).


Having jotted down at least 6 
years of blog entries with the prior front matter archetype it became 
pretty exhausting to attempt to fix it manually and I asked my friend 
for help. Here is the result!

## So what does it do exactly?

It converts the front matter inside of a file like this:
```
+++
author = "dotMavriQ"
title = "The Ninja Mission"
date = "2017-11-11"
description = "Who is Mats Helge Olsson, what did he do and what is his legacy?"
tags = ["Mats Helge Olsson", "Life"]
categories = ["Blog"]
images  = ["https://s3.eu-central-1.wasabisys.com/dotblog/dotBlog/Blog/2017-11-11-ninjamission.png"]
type = "post"
aliases = ["2017-11-11-Ninjamission"]
+++
```
into this:
```
+++
author = "dotMavriQ"
title = "The Ninja Mission"
date = "2017-11-11"
description = "Who is Mats Helge Olsson, what did he do and what is his legacy?"
tags = ["Mats Helge Olsson", "Life"]
categories = ["Blog"]
aliases = ["2017-11-11-Ninjamission"]
removeBlur = false
comments = false

[[images]]
src = "https://s3.eu-central-1.wasabisys.com/dotblog/dotBlog/Blog/2017-11-11-ninjamission.png"
alt = ""
stretch = ""
+++
```

### How do I use it though? 

Well, you can run it on a single file like this:
```
nottz.sh blogentry.md
```

Or, you can run it on entire folders like this:
```
for f in 2020/*.md; do ./nottz.sh "$f" > "$f.new"; done
```

#### Troubleshooting

Make sure that you have given it sufficient permissions if you are to run it on entire folders.
```
chmod +x nottz.sh`
```
##### Dependencies 

Make sure that you have `yj-git` and `jq` installed, they're both in the AUR.


#### Credit
This was written in a matter of minutes by a very good friend of mine.
Thanks Functie, I'll credit you if you feel like it's appropriate!


