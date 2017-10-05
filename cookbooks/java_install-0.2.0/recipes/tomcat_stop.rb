execute 'stopTomcat' do
	command " /opt/tomcat_codeathon_team_c_8_0_36/bin/shutdown.sh"
	action :run
	retries 3
    retry_delay 5
    ignore_failure true
end