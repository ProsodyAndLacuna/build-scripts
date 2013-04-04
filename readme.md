# Prosody and Lacuna build scripts

## `generate.sh`

Creates DeJong raw data for a range of `X`,`Y` coordinates. See the
script for more information.

## `generate-from-blendfile.sh`

Creates DeJong raw data from a file

This script requires you to pass in a Comma Separated Value (CSV) of
data in the format

    ?,x,y
    ?,x,y
    ?,x,y

NOTE: The value in the first column doesn't value

## Output

Both the `generate.sh` and `generate-from-blendfile.sh` create a gzipped
JSON object representing a computed DeJong render. This file can be read
by the `libdedong` Ruby Gem.
