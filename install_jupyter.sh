#!/bin/bash
export NODE_OPTIONS=--max-old-space-size=32768

EXTENSIONS="
@finos/perspective-jupyterlab@0.3.6
@jupyter-widgets/jupyterlab-manager@1.0.2  
@jupyter-widgets/jupyterlab-sidecar@0.4.0  
@jupyterlab/celltags@0.1.5  
@jupyterlab/git@0.7.0  
@jupyterlab/plotly-extension@1.0.0  
@jupyterlab/toc@1.0.1  
@mflevine/jupyterlab_html@0.1.4  
@oriolmirosa/jupyterlab_materialdarker@0.4.1  
@parente/jupyterlab-quickopen@0.3.0  
@pyviz/jupyterlab_pyviz@0.8.0  
bqplot@0.5.0-alpha.2  
ipyannotate@0.1.0
ipyevents@1.6.3  
ipysheet@0.4.3  
ipysigma@0.5.0  
ipyvolume@0.5.2  
jupyter-leaflet@0.11.1  
jupyter-matplotlib@0.4.2  
jupyter-threejs@2.1.1  
jupyterlab-chart-editor@1.2.0  
jupyterlab-dash@0.1.0-alpha.3  
jupyterlab-drawio@0.6.0  
jupyterlab-kernelspy@1.0.0  
jupyterlab-supersave@0.1.0  
jupyterlab_autoversion@0.1.0  
jupyterlab_bokeh@1.0.0  
jupyterlab_celltests@0.1.0  
jupyterlab_commands@0.1.2  
jupyterlab_email@0.2.0  
jupyterlab_iframe@0.2.1  
jupyterlab_templates@0.2.0 
lineup_widget@1.0.7  
nbdime-jupyterlab@1.0.0  
plotlywidget@1.0.0  
qgrid@1.1.1  
# beakerx_table-jupyterlab
# @quentinandre/jupyterlab_snippets
# jupyterlab_tensorboard
# pylantern
"

until jupyter labextension install $EXTENSIONS --no-build  
do
    echo "Extensions failed to install"
done

until jupyter lab build
do
    echo "Extension failed to install"
done

jupyter serverextension enable --py nbdime
jupyter serverextension enable --py jupyterlab_iframe
jupyter serverextension enable --py jupyterlab_autoversion
jupyter serverextension enable --py jupyterlab_celltests
jupyter serverextension enable --py jupyterlab_commands
jupyter serverextension enable --py jupyterlab_email
jupyter serverextension enable --py jupyterlab_git
jupyter serverextension enable --py jupyterlab_quickopen
# jupyter serverextension enable --py jupyterlab_snippets
jupyter serverextension enable --py jupyterlab_templates
jupyter serverextension enable --py nbresuse
# jupyter serverextension enable --py jupyter_tensorboard
