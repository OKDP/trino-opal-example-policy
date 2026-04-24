# Trino authorization policies using OPAL

This repository contains an example of a rego policy file and a json data file for [OPA (Open Policy Agent)](https://www.openpolicyagent.org/), taylored for the use of [Trino](https://trino.io/) with the queries performed by the job and notebooks in [OKDP examples](https://github.com/OKDP/okdp-examples).

The lists of users, operations and permissions are non exhaustive.

The goal of this repository is to give a test environment for its policies and data to be pulled by an [OPAL server](https://docs.opal.ac/) to an OPA server embedded in an OKDP cluster.
