---
layout: page
title: "Deep Learning Prequel"
category: tut
date: 2015-04-28 12:00:00
---

### Prequel to Prequel

If you are not familiar with Python or `numpy`, I strongly suggest you read the crash course prepared by _CS231n Convolutional Neural Networks for Visual Recognition_, you can access the it here: [Python numpy tutorial](http://cs231n.github.io/python-numpy-tutorial/).

The following contents assume that you are familiar with above mentioned tutorial.

Besides numpy, we are also going to use `Theano` library heavily. It enables your model can be trained on GPU. I suggest that you read the [tutorial](http://www.deeplearning.net/software/theano/tutorial/index.html#tutorial) in order to pick up the skills.

### Numpy Array

Numpy and SciPy is a powerful couple that supports scientific computing in Python. Here I documented some useful tricks and this list will keep growing if I found new ones.

+ __Use Array, Not Matrix__

	Numpy offers two data structures that handles multi-dimensional data. The one is Array, and another one is Matrix. We should understand that Matrix is extended by Array, and Array has more functions to use. The main difference is some computing operators.

+ __Use library whenever you can__

	Beginners of Python or Numpy tend to write their own functions because they have no idea if the functions is available. I strongly suggest that you should search internet before you proceed. Using library's function will offer you much more faster speed and stable performance

+ __Sort array by first column__

	~~~ python
	A=np.asarray([[1,2,3], [4,5,6], [0,0,1]]);
	A.view("float32, float32, float32").sort(order=["f1"], axis=0)
	~~~

### Mind Your Doc-strings

Python offered two styles of comment, and one of them is called doc-strings. Doc-strings allow you write and generate appropriate documentations.

They looks like this:

~~~ python
"""
some comments about the function
"""
~~~

or

~~~ python
'''
some comments about the function
'''
~~~

There are few head-ups:
+ Use doc-strings to write some general description about the script or the module.
+ Always write doc-strings for your function.
+ Make your doc-strings consistent and easy-to-read.
+ State every input and output variables of your function.

### Document Your Experiment

You will need to conduct and document your experiments in different configurations frequently. It is important that you can keep track everything automatically with minimal efforts. `sacred` is created for addressing this issue, you can find it [here](https://github.com/IDSIA/sacred).

You can install it through `pip`:

~~~
$ pip install sacred
~~~

You can check out the documentation of sacred from [here](http://sacred.readthedocs.org/en/latest/).

### Prepare Datasets

We mainly use MNIST and CIFAR-10 as our demonstration of the algorithms in the workshop. In this section, I wrote some helpful notes so that you can understand how to handle these datasets.

#### MNIST

The MNIST database of handwritten digits, available from this page, has a training set of 60,000 examples, and a test set of 10,000 examples. It is a subset of a larger set available from NIST. The digits have been size-normalized and centered in a fixed-size image. You can get a copy of MNIST from [here](http://yann.lecun.com/exdb/mnist/)

#### CIFAR-10

The CIFAR-10 dataset consists of 60000 32x32 colour images in 10 classes, with 6000 images per class. There are 50000 training images and 10000 test images. 

The dataset is divided into five training batches and one test batch, each with 10000 images. The test batch contains exactly 1000 randomly-selected images from each class. The training batches contain the remaining images in random order, but some training batches may contain more images from one class than another. Between them, the training batches contain exactly 5000 images from each class.

You can get a copy of CIFAR-10 from [here](http://www.cs.toronto.edu/~kriz/cifar.html)

#### Pre-processing Techniques

Here we present two useful pre-processing techniques in order to standardize the dataset. They are widely used in many projects.

### Principle Component Analysis

Principle Component Analysis (PCA) is a popular dimension reduction algorithm.

### ZCA Whitening
