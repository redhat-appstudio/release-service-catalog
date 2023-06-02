# FBC Release Pipeline

 Tekton release pipeline to interact with FBC Pipeline                       

## Parameters

| Name | Description | Optional | Default value |
|------|-------------|----------|---------------|
| snapshot | The Snapshot in JSON format | No | - |
| enterpriseContractPolicy | JSON representation of the EnterpriseContractPolicy | No | - |
| fromIndex | Index image (catalog of catalogs) the FBC fragment will be added to | No | - |
| targetIndex | Index image (catalog of catalogs) the FBC fragment will be added to | No | - |
| binaryImage | OCP binary image to be baked into the index image | Yes | "" |
| buildTags | List of additional tags the internal index image copy should be tagged with | Yes | "[]" |
| addArches | List of arches the index image should be built for | Yes | "[]" |
| requester | Name of the user that requested the signing, for auditing purposes | No | - |
| signingConfigMapName | The ConfigMap Name required by the Pipeline | Yes | "hacbs-signing-pipeline-config" |
| fbcPublishingCredentials | Secret used to publish the built index image | Yes | "fbc-publishing-credentials" |
| requestUpdateTimeout | Max seconds to wait until the status is updated | Yes | - |
| buildTimeoutSeconds | Max seconds to wait until the build finishes | Yes | - |

## Changelog

### Changes since 0.10
- updates tasks that uses `create-internal-request` task to 0.6
- `publish-index-image` now uses `create-internal-request`
- only executes `public-index-image` when extraData result has `fbc_opt_in=true` set

### Changes since 0.9
- changes on the following tasks due to `create-internal-request` changes:
    - `add-fbc-contribution-to-index-image` now accepts dynamic parameters
    - `sign-index-image` now accepts dynamic parameters
- changes on `publish-index-image` task to read data from its `inputDataFile` parameter
- adds cleanup task

### Changes since 0.8
- fixes in the README.md file
- adds param `fbcPublishingCredentials`
- removes param `overwriteFromIndex`
- adds new task `publish-index-image`

### Changes since 0.7
The syntax for `taskRef.bundle` and `pipelineRef.bundle` is deprecated,
bundles resolver is used with new format.

### Changes since 0.6
- adds sign-index-image task
- refactor task and change its reference name from `create-internal-request`
  to `add-fbc-contribution-to-index-image`
- adds `requester` and `signingConfigMapName` parameters
- removes `resolvedIndexImage` result

### Changes since 0.5
- updates `create-internal-request` task version to 0.3

### Changes since 0.4
- updates `create-internal-request` task version to 0.2
- adds `resolvedIndexImage` result

### Changes since 0.3
- removes param `fbcFragment`
- adds param `buildTimeoutSeconds`

### Changes since 0.2
- renames the pipeline to `fbc-release`
- forces the pipeline to run after `verify-enterprise-contract`

### Changes since 0.1
- adds param `requestUpdateTimeout`
- adds task result values to the pipeline results
  - `requestMessage` gets `$(tasks.create-internal-request.results.requestMessage)`
  - `requestReason` gets `$(tasks.create-internal-request.results.requestReason)`
  - `requestResults` gets `$(tasks.create-internal-request.results.requestResults)`
- changes `verify-enterprise-contract` task version