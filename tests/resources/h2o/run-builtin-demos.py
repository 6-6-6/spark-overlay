#!/usr/bin/env python

import h2o

for demo_function in ["gbm", "deeplearning", "glm"]:
    h2o.demo(demo_function, interactive=False)
