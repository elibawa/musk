## Musk

[![Build Status](https://travis-ci.org/pempel/musk.svg?branch=master)](https://travis-ci.org/pempel/musk)
[![Coverage Status](https://coveralls.io/repos/pempel/musk/badge.png)](https://coveralls.io/r/pempel/musk)
[![Gem Version](https://badge.fury.io/rb/musk.png)](http://badge.fury.io/rb/musk)

Use musk to impart the demonic scent of musk to your music.
Musk allows you to extract tags from MP3 files and perfume MP3 files
with fragrant tags.

## Installation

Manually from RubyGems.org:

    gem install musk

## Command Reference

Like `git`, the `musk` command delegates to subcommands based on its
first argument. The most common subcommands are:

### musk extract

To extract tags from an MP3 file, run `musk extract` with the path to
the MP3 file. For example,

    musk extract ~/tracks/bonobo/jets.mp3

    Path:     jets.mp3
    Title:    Jets
    Position: 6/13
    Artist:   Bonobo
    Release:  The North Borders
    Genre:    Electronic
    Year:     2013
    Comment:  -

To extract tags from MP3 files in a directory and its subdirectories,
run `musk extract` with the path to the directory. For example,

    musk extract ~/tracks

    Path:     bonobo/jets.mp3
    Title:    Jets
    Position: 6/13
    Artist:   Bonobo
    Release:  The North Borders
    Genre:    Electronic
    Year:     2013
    Comment:  -

    Path:     emancipator/kamakura.mp3
    Title:    Kamakura
    Position: 4/14
    Artist:   Emancipator
    Release:  Safe In The Steep Cliffs
    Genre:    Electronic
    Year:     2010
    Comment:  -

To see the output in the csv format, run `musk extract --format csv`.
For example,

    musk extract --format csv ~/tracks

    bonobo/jets.mp3,Jets,6/13,Bonobo,The North Borders,Electronic,2013,-
    emancipator/kamakura.mp3,Kamakura,4/14,Emancipator,Safe In The Steep Cliffs,Electronic,2010,-

The `--format csv` option prints MP3 tags in the following order:
path, title, position, artist, release, genre, year, comment.

The `--format csv` option allows you to effectively combine
several commands together. For example,

    musk extract --format csv ~/tracks | cut -d',' -f2

    Jets
    Kamakura

## License

(The MIT license)

Copyright (c) 2014 Eugene Pempel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
