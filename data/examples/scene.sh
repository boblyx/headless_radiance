#!/bin/bash
# Create a light source
SCENE=tmp/scene.oct
PICT=tmp/scene.hdr
oconv assets/scene.rad > $SCENE
rpict -vp -6 7 6.5 -vd 5 -5 -5 $SCENE > $PICT

