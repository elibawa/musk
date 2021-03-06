## Musk

[![Gem Version](http://img.shields.io/gem/v/musk.svg)](https://badge.fury.io/rb/musk)
[![Code Climate](http://img.shields.io/codeclimate/github/pempel/musk.svg)](https://codeclimate.com/github/pempel/musk)
[![Coverage Status](http://img.shields.io/coveralls/pempel/musk/master.svg)](https://coveralls.io/r/pempel/musk?branch=master)
[![Build Status](http://img.shields.io/travis/pempel/musk/master.svg)](https://travis-ci.org/pempel/musk)
[![Dependency Status](http://img.shields.io/gemnasium/pempel/musk.svg)](https://gemnasium.com/pempel/musk)
[![MIT License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](https://tldrlegal.com/license/mit-license)

Use musk to impart the demonic scent of musk to your music.
Musk allows you to extract tags from MP3 files and perfume MP3 files
with fragrant tags.

## Installation

If you're on Ubuntu, you need to have the following packages
that `musk` depends on: ruby-dev and libtag1-dev. To install
these dependencies, you can use:

    sudo apt-get update
    sudo apt-get install ruby-dev libtag1-dev

If you're on Mac OS X, you can use:

    brew update
    brew install taglib

When you have all the necessary dependencies, you can use:

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

The MIT License (MIT)

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
