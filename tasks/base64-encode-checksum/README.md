# base64-encode-checksum

Task to encode the Terraform Checksum file.

It returns as a result the blob to sign, that is the result of the base64 encoded checksum

## Parameters

| Name                 | Description                                                        | Optional  | Default value                                         |
|----------------------|--------------------------------------------------------------------|-----------|-------------------------------------------------------|
| binaries_dir         | Path inside the image where the binaries to extract are stored     | Yes       | "binaries"                                           |
