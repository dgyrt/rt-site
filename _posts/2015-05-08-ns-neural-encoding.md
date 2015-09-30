---
layout: page
title: "Neural Encoding"
category: ns
date: 2015-05-08 12:00:00
---

### Encoding and Decoding

+ Encoding solves "how does a stimulus cause a pattern of responses?" (\\(P(\text{response}|\text{stimulus})\\)).
+ Decoding solves "what do these responses tell us about the stimulus?" (\\(P(\text{stimulus}|\text{response})\\)).

### Basic Coding Model

In the following context, \\(s(\cdot)\\) represents signal, \\(r(\cdot)\\) represents response, \\(f(\cdot)\\) represents filter and \\(g(\cdot)\\) represents nonlinear function.

#### Linear response

$$
r(t)=\phi s(t)
$$

#### Temporal filtering: linear filters

$$
r(t)=\sum\_{k=0}^{n}s\_{t-k}f\_{k}
$$

$$
r(t)=\int\_{-\infty}^{t}d\,\tau s(t-\tau)f(\tau)
$$

#### Spatial filtering

$$
r(x,y)=\sum\_{x'=-n, y'=-n}^{n}s\_{x-x', y-y'}f\_{x'y'}
$$

$$
r(x,y)=\int\_{-\infty}^{\infty}d\,x' d\,y' s(x-x', y-y')f(x', y')
$$

#### Spatio-temporal filtering

$$
r\_{x,y}(t)=\iiint d\,x' d\,y' d\,\tau f(x',y',\tau)s(x-x',y-y',t-\tau)
$$

#### Linear filter & nonlinearity

$$
r(t)=g(s*f)
$$

### Feature Selection

We want to sample the responses of the system to many stimuli so we can characterize what it is about the input that triggers responses.

### Variability

Kullback-Leibler divergence: difference between two probability distribution.

$$
D\_{KL}(P(s), Q(s))=\int d\,s P(s)\log\_{2}\frac{P(s)}{Q(s)}
$$

Tuning curve:

$$
P(\text{spike}|s\_{f})=\frac{P(s\_{f}|\text{spike})P(\text{spike})}{P(s\_{f})}
$$

The Goodness measure between \\(P(s\_{f}|\text{spike})\\) and \\(P(s\_{f})\\):

$$
D\_{KL}(P(s\_{f}|\text{spike}), P(s\_{f}))
$$

#### Binominal spiking

Distribution:

$$
P\_{n}[k]=p^{k}(1-p)^{k}
$$

Mean:

$$
\langle k\rangle=np
$$

Variance:

$$
\sigma^{2}=np(1-p)
$$

#### Poisson spiking

Distribution:

$$
P\_{T}[k]=(rT)^{k}\frac{\exp(-rT)}{k!}
$$

Mean:

$$
\langle k\rangle=rT
$$

Variance:

$$
\sigma^{2}=rT
$$

Fano factor:

$$
F=1
$$

Interval distribution:

$$
P(T)=r\exp(-rT)
$$
