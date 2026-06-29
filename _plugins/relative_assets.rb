# frozen_string_literal: true

require "fileutils"

Jekyll::Hooks.register [:pages, :documents], :post_write do |item|
  source_path = item.respond_to?(:relative_path) ? item.relative_path : item.path
  next if source_path.nil? || item.output.nil?

  source_file = File.join(item.site.source, source_path)
  next unless File.file?(source_file)

  source_dir = File.dirname(source_file)
  source_name = File.basename(source_file, File.extname(source_file))
  assets_dir = File.join(source_dir, "#{source_name}.assets")
  next unless Dir.exist?(assets_dir)

  output_dir = File.dirname(item.output)
  target_dir = File.join(output_dir, File.basename(assets_dir))

  FileUtils.rm_rf(target_dir)
  FileUtils.mkdir_p(output_dir)
  FileUtils.cp_r(assets_dir, target_dir)
end
