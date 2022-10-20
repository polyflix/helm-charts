# Polyflix Helm Charts

This repository contains the official Polyflix Helm charts.

## Install the repository

To install the repository on your host and be able to pull charts from it, you'll need to execute the following command : 

```shell
$ helm repo add polyflix https://polyflix.github.io/helm-charts
```

You're now ready to work with the repository. **For detailed explanations about how to install a specific chart, please see the concerned chart directory**.

## Documentation

The chart documentation is important and needs to be maintained. To make easy this task, we use [helm-docs](https://github.com/norwoodj/helm-docs) to generate the documentation based on the chart `values.yml`. The repository provide a [template of README](./template/README.tpl.md), and [helm-docs](https://github.com/norwoodj/helm-docs) will generate a `README.md` into the chart folder if you have installed the [pre-commit](https://pre-commit.com/#install).

If you wish to generate the documentation manually, simply run the following command from **the root of the project** :

```shell
helm-docs --chart-search-root=charts --template-files template/README.tpl.md
```

## Contributing

### Prerequisites

- [helm-docs](https://github.com/norwoodj/helm-docs)
- [pre-commit](https://pre-commit.com/#install)

Run the following commands to install the pre-commit hooks : 

```shell
pre-commit install
pre-commit install-hooks
```

In order to make updates on one or more charts on the project, please follow the following instructions :

- Make a branch and do your changes
- Run the [helm-docs](https://github.com/norwoodj/helm-docs) command to make sure the documentation is up to date.
- Once everything is ok, **don't forget to bump the chart(s) version(s) to trigger a new release when your PR will be merged.**
