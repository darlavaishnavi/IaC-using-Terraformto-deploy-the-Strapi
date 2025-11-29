module.exports = ({ env }) => ({
  upload: {
    config: {
      provider: "@strapi/provider-upload-aws-s3",
      providerOptions: {
        s3: {
          region: env("AWS_REGION"),
          params: {
            Bucket: env("AWS_S3_BUCKET"),
          },
        },
      },
    },
  },
});

