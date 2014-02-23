Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = {
  bucket: 'tour_files',
  access_key_id: ENV.fetch('S3_KEY'),
  secret_access_key: ENV.fetch('S3_SECRET_KEY')
}
