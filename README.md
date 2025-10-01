# Cytomine Bootstrap

> [!WARNING]  
> **Deprecated:** This repository is no longer maintained. Please see [cytomine/cytomine](https://github.com/cytomine/cytomine) for the latest version.

> Cytomine bootstrap is the installer for Cytomine. The application can run on a server to allow remote users to access the web platform or locally on your own machine.

[![GitHub release](https://img.shields.io/github/release/Cytomine-ULiege/Cytomine-bootstrap.svg)](https://github.com/Cytomine-ULiege/Cytomine-bootstrap/releases)
[![GitHub](https://img.shields.io/github/license/Cytomine-ULiege/Cytomine-bootstrap.svg)](https://github.com/Cytomine-ULiege/Cytomine-bootstrap/blob/master/LICENSE)

## Overview

[Cytomine](http://cytomine.org) is, to the best of our knowledge, the first open-source rich internet application to enable highly collaborative and multidisciplinary analysis of multi-gigapixel imaging data.

This bootstrap procedure allows you to configure your installation and generate an installer script based on this configuration. 
All Cytomine components run in Docker containers so that the only requirement is Docker.


## Install

**To install *official* release of Cytomine, see @cytomine. Follow this guide to install forked version by ULiege.** 

Follow the detailed guide to install Cytomine [Install Community Edition Legacy](https://doc.uliege.cytomine.org/admin-guide/legacy/legacy-install)

Basically,
1. Fill the `configuration.sh` file
2. Generate your installation script by running `bash init.sh`
3. Run the generated script `bash start.sh`

To restart the server, run `bash restart.sh`.

## Documentation

Full documentation can be found at [https://doc.uliege.cytomine.org/](https://doc.uliege.cytomine.org/).

## References

When using our software, we kindly ask you to cite our website url and related publications in all your work (publications, studies, oral presentations,...). In particular, we recommend to cite (Marée et al., Bioinformatics 2016) paper, and to use our logo when appropriate. See our license files for additional details.

- URL: http://www.cytomine.org/
- Logo: [Available here](https://cytomine.coop/sites/cytomine.coop/files/inline-images/logo-300-org.png)
- Scientific paper: Raphaël Marée, Loïc Rollus, Benjamin Stévens, Renaud Hoyoux, Gilles Louppe, Rémy Vandaele, Jean-Michel Begon, Philipp Kainz, Pierre Geurts and Louis Wehenkel. Collaborative analysis of multi-gigapixel imaging data using Cytomine, Bioinformatics, DOI: [10.1093/bioinformatics/btw013](http://dx.doi.org/10.1093/bioinformatics/btw013), 2016.

## License

Apache 2.0
