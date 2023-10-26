# AWS-SAM Java 17 workspace

This project builds a container image which can be used to build and deploy Java 17 based
projects using the AWS and AWS SAM cli.

## Usage

From the directory you want to work with (i.e. your project directory):

```shell
docker run -v ./:/workspace --rm -it ghcr.io/lesteenman/docker-aws-sam-java17-workspace:main
```

After this, you land in a shell in the container image, where you can run `gradle` or `mvn` commands
to build your project, then deploy using `sam` or `aws` commands.

## AWS Credentials and configuration

You should pass in AWS credentials to your container to actually deploy as well. Preferrably, do this
by generating a set of temporary credentials, and entering those in your workspace shell:

```shell
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...
```

These might be generated using your AWS SSO login page, or with a tool like [aws-vault](https://github.com/99designs/aws-vault/blob/master/USAGE.md#using---no-session).

Alternatively though heavily discouraged, you can bind your `~/.aws/credentials` file as a read-only volume mount in your container.
