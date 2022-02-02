# ECA-Art :art:
Generating progressive art using Elementary Cellular Automata. Written in <img src=https://upload.wikimedia.org/wikipedia/commons/6/6a/Godot_icon.svg width=20 height=20> with :heart:.

![]("https://github.com/hejcman/ECA-Art/blob/master/Assets/readme/recording.gif")

## Elementary Cellular Automata :brain:

[Elementary Cellular Automata (ECA)](https://en.wikipedia.org/wiki/Elementary_cellular_automaton) are one dimensional cellular automata, where the state of the cell is decided based on the state of its ancestors in the previous generation. ECA are usually designed as binary systems, where the cells are usually alive (1) or dead (0).

<p align="center">
  <img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/readme/evolution.png" width=400px>
</p>

Since the new cells usually look at 3 cells in the previous generation, we must have 8 rules regarding their behavior (from `b111` to `b000`). This is the order of rules that you will find in the application. Furthermore, rules are usually called based on the decimal representation of their binary form, eg. [rule 30](https://en.wikipedia.org/wiki/Rule_30), [rule 90](https://en.wikipedia.org/wiki/Rule_90), etc.

### What I do differently

Rather than having cells be "alive" or "dead", it is possible to assign them any color from the RGB space. To decide whether the previous cell is alive or not, the cell color is converted to grayscale such that the cell "aliveness" is `a = (h + s + v)/3`, where HSV is the alternative representation of the RGB model. Whether the cell should be considered alive or not is then decided using the threshold, which ranges from 0 to 1, and is set to 0.5 by default. Moving it lower means more cells will be considered alive and vice versa.

Furthermore, it is possible to decide the speed of the evolution of further cells, pause the automaton, or change all the colors and values in real time.

All this is done to allow a dynamic approach to the improvisation of art using the automaton.

### Further experiments

- It might be interesting to look at 5 or 7 previous cells rather then just 3. However, the number of rules that then need to exist grows exponentially (32 rules for 5 cells and 128 rules for 7 cells). I have not found a nice way to make this presentable to the user.
- I would like to make it possible for the user to take screenshots of their work. It is currently possible to zoom and pan the camera, but the viewport can't be saved. This is work in progress.
- Going "back" (Ctrl + Z) doesn't work.

## Installation :notebook_with_decorative_cover:

TODO

## Gallery :framed_picture:

<p align="center" float="left">
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon2.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon3.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon4.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon5.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon6.png" width=50% height=50%>
<img src="https://github.com/hejcman/ECA-Art/blob/master/Assets/icon7.png" width=50% height=50%>
</p>
  
