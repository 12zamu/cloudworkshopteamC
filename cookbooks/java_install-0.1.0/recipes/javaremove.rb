execute 'removejava' do
  command 'yum remove java* -y'
  command 'yum remove java-1.8.0-openjdk.x86_64 -y'
  command 'sleep 10'
  #ignore_failure true
end
