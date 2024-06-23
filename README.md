# synmax-hyperion-v3-docs

1. [Install Sphinx](https://www.sphinx-doc.org/en/master/usage/installation.html) on your computer. 

2. Install extensions required by this project ("sphinx-tabs" and "sphinxawesome-theme") with pip: 
`pip install [extension name]`

3. There are two important folders inside the repo: "source" and "build". ONLY edit the files inside the "source" folder. The .rst files use reStructuredText markup. You can read more about it [here](https://devguide.python.org/documentation/markup/).

4. There is a configuration file called "conf.py" which includes settings for the project. Read more about it [here](https://www.sphinx-doc.org/en/master/usage/configuration.html).

5. Once you have made any changes inside the "source" folder, use the following command in the root directory to build the project. New files should appear in the "build" folder: 
`sphinx-build -b html source build`

6. To publish the built project to the hosting service, please upload only the "build" folder or create a new git repo inside the "build" folder and push ONLY that.

7. This project is currently hosted on WPengine. To publish built files from Sphinx to a WP Engine Git repository, please follow this [tutorial](https://wpengine.com/support/git/).