define :wordpress_deploy_dir do

  bash "chmod wp-content" do
    user deploy[:user]
    cwd params[:path]
    code "chmod -R g+rwX #{params[:path]}"
  end

end
