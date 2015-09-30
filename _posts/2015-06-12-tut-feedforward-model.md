---
layout: page
title: "Feedforword Model"
category: tut
date: 2015-06-12 12:00:00
---

__I assumed you have the knowledge of following topics:__

+ __[Feedforward Layer](tut-layer.html)__
+ __[SVM and Softmax Regression](tut-svm-softmax.html)__
+ __[MLP Layers](tut-mlp.html)__

Now we are finally going to construct a complete Feedforward Neural Network. All the layers are hooked up by a process of _Forward Propagation_. And later in this tutorial, we will train this network with _Backpropagation Algorithm_, a close derivation of Gradient-based Optimization.

### Forward Propagation

Forward Propagation, or usually `fprop` is rather simple in feedforward layer, you can take previous output as input and produce the output for next layer.

A example implementation looks like this ([here](https://github.com/duguyue100/telaugesa/blob/master/telaugesa/model.py#L24-L47)):

~~~ python
    def fprop(self,
              X):
        """Forward propagation
        
        Parameters
        ----------
        X : matrix or 4D tensor
            input samples, the size is (number of cases, in_dim)
            
        Returns
        -------
        out : list
            output list from each layer
        """
        
        out=[];
        level_out=X;
        for k, layer in enumerate(self.layers):
            
            level_out=layer.apply(level_out);
            
            out.append(level_out);
            
        return out;
~~~

Here the loop iterates through all the layers and each layer is applied to previous layer's output. Note that a uniform API is important when you develop a Deep Learning algorithm.

#### Example of create a network model

~~~ python
layer_0=ReLULayer(in_dim=784,
                  out_dim=500);
layer_1=ReLULayer(in_dim=500,
                  out_dim=200);
layer_2=SoftmaxLayer(in_dim=200,
                     out_dim=10);
                                          
model=FeedForward(layers=[layer_0, layer_1, layer_2]);
~~~

The above code describes 3 layers network, the first 2 layers are `ReLULayer` and the output layer is `SoftmaxLayer`.

### Cost Function

In order to train a neural network using gradient-based algorithm, there are two necessary parts: a cost function and a list of parameters that is subject to change. The simplest form _Stochastic Gradient Descent_ (SGD) is updated by:

$$
W^{*}=\frac{\partial}{\partial W} J
$$

where \\(J\\) is the function.

A cost is defined as the difference between actual output and target output. Here since we use Softmax layer, we described here in code for categorical cross entropy cost ([here](https://github.com/duguyue100/telaugesa/blob/master/telaugesa/cost.py#L50-L66)).

Categorical cross entropy summarized cross entropy between 2 probability distribution (Remember that output of Softmax Layer is a probability distribution).

$$
H(p,q)=-\sum_{x}p(x)\log(q(x))
$$

~~~ python
def categorical_cross_entropy_cost(Y_hat, Y_star):
    """Categorical Cross Entropy Cost
    
    Parameters
    ----------
    Y_hat : tensor
        predicted output of neural network
    Y_star : tensor
        optimal output of neural network
        
    Returns
    -------
    costs : scalar
        cost of Categorical Cross Entropy Cost
    """
    
    return T.nnet.categorical_crossentropy(Y_hat, Y_star).mean();
~~~

Besides the cost between actual output and target, we usually also introduce L1 and L2 regularization

### Summary Parameters

All relevant parameters in the model should be documented together in order to get the correct gradient for the entire model. You can use an one-liner to do this job:

~~~ python
    @property
    def params(self):
        return [param for layer in self.layers if hasattr(layer, 'params') for param in layer.params];
~~~

The above code is what I used to zip all parameters in the neural network.

### Training Model

Usually, writing a BP algorithm is tedious and complex. Since Theano introduced auto-gradient method based on computation graph search. This process is now easy and flexible to all kinds of use.

You just need to call the function `grad(cost, params)`, it will compute a corresponding list of parameter gradients.

~~~ python
    gparams=T.grad(cost, params);
    
    for gparam, param in zip(gparams, params):
        if method=="sgd":
            updates[param]=param-learning_rate*gparam;
~~~

The above is a typical example of SGD.

You can then use the updates of the parameters to build a training model:

~~~ python
train=theano.function(inputs=[idx],
                      outputs=cost,
                      updates=updates,
                      givens={X: train_set_x[idx * batch_size: (idx + 1) * batch_size],
                              y: train_set_y[idx * batch_size: (idx + 1) * batch_size]});
~~~

The above Theano function can be used to train all the parameters. Given a batch of data, the cost is used to update the parameters. the rest for the training is just to call this function on every training batch in number of epochs.
