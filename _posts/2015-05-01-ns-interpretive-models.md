---
layout: page
title: "Interpretive Models"
category: ns
date: 2015-05-01 12:00:00
---

Interpretive models use computational and information-theoretic principles to explore the behavioral and cognitive significance of various aspects of nervous system function, addressing the question of why nervous system operate as they do.

### Interpretive Models of Receptive Fields

Efficient Coding Hypothesis:

> Suppose the goal is to _represent images as faithfully and efficiently as possible_ using neurons with receptive \\(RF\_1\\), \\(RF\_1\\), etc.

Given Image \\(I\\), we can _reconstruct_ \\(I\\) using neural responses \\(r\_{1}\\), \\(r\_{2}\\), ..:

$$
\hat{I}=\sum\_{i}RF\_{i} r\_{i}
$$

Idea is what are the \\(RF\_{i}\\) that _minimize_ the total squared pixelwise _errors_ between \\(I\\) and \\(\hat{I}\\) and are as _independent_ as possible?

One can start out with random \\(RF\_{i}\\) and run _efficient coding algorithm_ on _natural image patches__, you can use Sparse Coding, ICA (independent component analysis)  or predictive coding. The brain may be trying to find _faithful and efficient_ representation of an animal's natural environment.
