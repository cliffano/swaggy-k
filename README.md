<img align="right" src="https://raw.github.com/cliffano/swaggy-k/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/swaggy-k/actions/workflows/ci-workflow.yaml/badge.svg)](https://github.com/cliffano/swaggy-k/actions/workflows/ci-workflow.yaml)
<br/>

Swaggy K
--------

Swaggy K is a builder for [Kiota](https://learn.microsoft.com/en-us/openapi/kiota/overview)-generated API clients in multiple technology stacks.

It provides utility targets for generating the API clients, building, testing, and publishing the artifacts, from an OpenAPI spec in one go.

Have a look at [OpenAPI Azure IP Ranges](https://github.com/cliffano/openapi-azureipranges) as an example project that was built using Swaggy K.

Installation
------------

1. Copy `src/Makefile-swaggy-k` to be the `Makefile` of your project:
    curl https://raw.githubusercontent.com/cliffano/swaggy-k/main/src/Makefile-swaggy-k -o Makefile
2. Create configuration file `swaggy-k.yml` with properties described in [Configuration](#configuration) section
3. Run the available `Makefile` targets described in [Usage](#usage) section

Configuration
-------------

Create Swaggy K configuration file called `swaggy-k.yml` with contains the following properties:

| Property | Description | Example |
|----------|-------------|---------|
| spec_uri | File path or URL where the OpenAPI specification is located | `spec/some-app.yaml` or `https://some-app.com/some-app.yaml` |
| name | Name of the application using Swaggy K | `SomeApp` |
| version | Version of the application using Swaggy K | `1.2.3` |
| contact.name | Contact name to be amended to the OpenAPI specification | `John Citizen` |
| contact.url | Contact URL to be amended to the OpenAPI specification | `https://some-app.com` |
| contact.email | Contact email to be amended to the OpenAPI specification | `johnc@some-app.com` |
| base_dir.github_actions | Absolute path where the application base directory is located within GitHub Actions runner | `/home/runner/work/some-app/some-app` |
| base_dir.local | Absolute path where the application base directory is located within your local environment | `/Users/some-user/some-path/some-app` |

Usage
-----

The following targets are available:

| Target | Description |
|--------|-------------|
| ci | CI target to be executed by CI/CD tool |
| stage | Ensure stage directory exists |
| clean | Remove all generated API clients code |
| deps | Retrieve the OpenAPI Generator Docker image and npm modules |
| init-spec | Initialise OpenAPI specification from either a local file path or a remote URL |
| update-to-latest | Update Makefile to the latest version on origin's main branch |
| update-to-version | Update Makefile to the version defined in TARGET_SWAGGY_K_VERSION parameter |
| generate | Alias for generate-all target |
| generate-all | Generate API clients for all languages, this is separate from generate-primary target in order to reduce the build time when processing primary languages |
| generate-primary | Generate API clients for primary languages only |
| build-<lang> | API clients building targets for primary languages |
| test-<lang> | API clients testing targets for primary languages |
| publish-<lang> | API clients package publishing targets for primary languages |
| doc | Alias for doc-latest target |
| doc-latest | Generate API documentation locally as the latest version |
| doc-version | Generate API documentation locally as the application's version |
| doc-publish | Publish documentation via GitHub Pages |
