if Rails.env.production?
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:bucket] = ENV['S3_BUCKET_NAME']
Paperclip::Attachment.default_options[:s3_credentials] = {
   access_key_id: ENV['AWS_ACCESS_KEY_ID'],
   secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
}
end

