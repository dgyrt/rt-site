---
layout: page
title: "Softmax Regression"
category: tut
date: 2015-04-29 12:00:00
---

Softmax Regression can be recognize as a feedforward layer with a softmax activation function. It's extremely popular in Deep Learning Community for multi-class classification. It is a direct derivation from Logistic Regression. The output of each sample is a probability distribution \\(p(y\|x)\\) where \\(y\\) is the label.

We usually minimize Categorical Cross Entropy cost to train a Softmax Regression Layer. This cost can measure the cross entropy between predicted output and target output.

~~~ python
class SoftmaxLayer(Layer):
    """Softmax Layer"""
    def __init__(self, **kwargs):
        super(SoftmaxLayer, self).__init__(**kwargs);
        
    def apply(self, X):
        return nnfuns.softmax(self.apply_lin(X));
    
    def predict(self, X_out):
        """Predict label
        
        Parameters
        ----------
        X_out : matrix
            input sample outputs, the size is (number of cases, number of classes)
            
        Returns
        -------
        Y_pred : vector
            predicted label, the size is (number of cases)
        """
        
        return T.argmax(X_out, axis=1);
    
    def error(self, X_out, Y):
        """Mis-classified label
        
        Parameters
        ----------
        X_out : vector
            predict labels, the size is (number of cases, number of classes)
        Y : vector
            correct labels, the size is (number of cases)
            
        Returns
        -------
        error : scalar
            difference between predicted label and true label.
        """
    
        return T.mean(T.neq(self.predict(X_out), Y));
~~~
