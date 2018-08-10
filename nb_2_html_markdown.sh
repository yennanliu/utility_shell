#!/bin/sh


# credit 
# http://nbconvert.readthedocs.io/en/latest/usage.html
# todo :
# let user can input notebook name 

# nb to html 
jupyter nbconvert --to html <your_notebook>.ipynb


# nb to markdown 
jupyter nbconvert --to markdown <your_notebook>.ipynb
