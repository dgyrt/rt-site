---
layout: page
title: "ConvNetJS"
category: tut
date: 2015-04-25 12:00:00
---

I'm a fan of using Machine Learning everywhere. And few months ago, when I learned there are some teams that are working on libraries that can run on web browsers, I checked them right away. There are few popular choices: [ConvNetJS](http://cs.stanford.edu/people/karpathy/convnetjs/index.html), [DeepLearning4j](http://deeplearning4j.org/), [sushi](https://github.com/mil-tokyo/sushi) and its sisters [sashimi](https://github.com/mil-tokyo/sashimi), [sukiyaki](https://github.com/mil-tokyo/sukiyaki).

Among these choices, I love the idea of ConvNetJS, and now I finally got the chance and time to use and hack it. This page is not just a tutorial for beginners, but also a chance for me to study. And I'm not gonna lie, I'm a terrible HTML coder, all the knowledge I knew about HTML is from a big book from Apache that I read approximately 7 years ago.

The future belongs to your internet and browser, not some sort of big-ass server. Billions of computers out there are the most powerful computing resources on this planet.

### How to start

The reason why I love ConvNetJS is because it offered a clean design. If you are just a user that wants to use it, then you might be interested in its core build [convnet-min.js](http://cs.stanford.edu/people/karpathy/convnetjs/build/convnet-min.js). Once you include it in your HTML source, then you are ready to go:

~~~ html
<!-- some script here -->
<script src="/path/to/convnet-min.js"></script>
~~~

On the another hand, I suggest you to fork the GitHub repo if you planned to make some changes, it's [here](https://github.com/karpathy/convnetjs).

### Start with a simple test
