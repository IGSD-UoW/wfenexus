# Visualizing Water-Food-Energy Nexus

This is a prototype for [Creating interfaces](https://creatinginterfaces.eifer.kit.edu/)'s WP4.

## Notes

This repo has been configured to use some best practices for reproducible science:

1. [`renv`](https://rstudio.github.io/renv/articles/renv.html) to manage dependencies.
2. Repo as a Package [+info](https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio)

## Installation

1. Clone this repo: `git clone git@github.com:IGSD-UoW/wfenexus.git`
2. Install `renv` if not already installed.
2. Run `renv::restore()` to restore the state of your project from `renv.lock`.


## Troubleshooting

If facing issues installing packages from Windows, run this command. (more info [in `renv` documentation](https://rstudio.github.io/renv/articles/renv.html#downloads-1), [in this discussion](https://community.rstudio.com/t/cant-install-packages-with-renv/96696/6) and [this question in SO](https://stackoverflow.com/questions/67228070/renvrestore-always-fails-in-windows))


```
Sys.setenv(RENV_DOWNLOAD_METHOD = "wininet")
#Sys.setenv(RENV_DOWNLOAD_METHOD = "libcurl")
```

