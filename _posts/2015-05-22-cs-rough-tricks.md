---
layout: page
title: "Rough Tricks"
category: cs
date: 2015-05-22 12:00:00
---

I'm learning stuffs everyday. Sometimes when I had an idea, and tried to implement it, I will do lots of searches and trails in order to complete the mission. But I'm a horrible person of memorizing these tricks (especially on web programming). Hence, I had this page to document all kinds of tricks related to programming and application design.

### highlight.js Language Highlighting Reference

Sometimes I forget the shortcut of the programming language when I use code highlighting, you can find it [here](http://highlightjs.readthedocs.org/en/latest/css-classes-reference.html).

### Customize HTML Table Style

~~~ css
table {
    border-collapse: collapse;
}

table, th, td{
    border: 1px solid #dedede;
}

tr:nth-child(even){
    background: #f2f2f2
}

tr:nth-child(odd){
    background: #fff
}

.table th, .table td{
    padding: 20px;
}

tr:hover, td:hover{
    background: #ffff99;
}
~~~

### Use Google Maps

A good start of this is to check out Google's documentation: [Add a Google Map to your website](https://developers.google.com/maps/tutorials/fundamentals/adding-a-google-map). Here I give an example of include Google Map in GitHub pages.

First of all, you need to include Google Maps javascript in your layout:

~~~ html
<script src="https://maps.googleapis.com/maps/api/js"></script>
~~~

You can usually find layout scripts in `_layout` ([example](https://github.com/duguyue100/duguyue100.github.io/blob/master/_layouts/default.html#L4)).

~~~ css
#map-canvas {
	width: 500px;
	height: 400px;
}
~~~

Here you can set the width and height of the map that you want to display.

Then, in you post, you need to define the specifics by implementing `initialize` function:

~~~ html
<script>
    function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
		var mapOptions = {
			center: new google.maps.LatLng(44.5403, -78.5463),
			zoom: 8,
			mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions)
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
~~~

In `mapOptions`, you can specify details of your desire map. You can find all supported options from [here](https://developers.google.com/maps/documentation/javascript/reference#MapOptions).

After you did everything, you can simply include the map as follows:

~~~ html
<div id="map-canvas"></div>
~~~

### Google Charts

I'm looking for a way of visualizing my data in website, and then I found this nice API that is written by Google, namely Google Charts, you can find the full documentation [here](https://developers.google.com/chart/interactive/docs/index)

### Setup Theano in OSX

Setting up Theano on my MacBook Pro used to be hard. I don't have a GPU on it, and apparently it's hard to get all requirements easily for OSX. I found the solution today, first, install [Anaconda](http://continuum.io/downloads), a nice python distribution that is designed for scientific computing.

However, you will notice that Anaconda itself does not offer you a maintained install of Theano. Then we have to get it from another place: [binstar](https://binstar.org/).

You can install the OSX build Theano by:

~~~
conda install -c https://conda.binstar.org/shoyer theano
~~~

#### Test for embedding YouTube Videos

<div>
<iframe width="560" height="315" src="https://www.youtube.com/embed/nfWlot6h_JM" frameborder="0" allowfullscreen></iframe>
</div>

#### Switch off dropout in Torch 7

`evaluate()` sets the mode of the Module (or sub-modules) to `train=false`. This is useful for modules like Dropout that have a different behaviour during training vs evaluation.

~~~lua
net=loadcaffe.load(prototxt, binary);
net:evaluate(); -- switch off dropout
~~~

#### some tests for Atom

something tests for atom.

#### Testing for spoiler tag

+ This is a thing

  [Spoiler Text. Is this right?](#spoiler)


